function [mosaic,H,index_mismatch] = same_page_test(im1, im2,index_mismatch,n)

threshold = 1; 

% Make single
im1 = im2single(im1) ;
im2 = im2single(im2) ;

% Make grayscale
if size(im1,3) > 1, im1g = rgb2gray(im1) ; else im1g = im1 ; end
if size(im2,3) > 1, im2g = rgb2gray(im2) ; else im2g = im2 ; end

% --------------------------------------------------------------------
%                                                         SIFT matches
% --------------------------------------------------------------------

[f1,d1] = vl_sift(im1g) ;
[f2,d2] = vl_sift(im2g) ;

[matches, scores] = vl_ubcmatch(d1,d2) ;

numMatches = size(matches,2) ;

% Number of iterations for RANSAC
num_iter = 1000 ;

X1 = f1(1:2,matches(1,:)) ; X1(3,:) = 1 ;
X2 = f2(1:2,matches(2,:)) ; X2(3,:) = 1 ;

% --------------------------------------------------------------------
%                                         RANSAC with homography model
% --------------------------------------------------------------------
     clear H score ok ;
     for t = 1:num_iter
      % estimate homography
      N = 4; % For RANSAC
      subset = vl_colsubset(1:numMatches, N) ;
      A = [] ;
      for i = subset
        A = cat(1, A, kron(X1(:,i)', vl_hat(X2(:,i)))) ;
      end
      [U,S,V] = svd(A) ;
      H{t} = reshape(V(:,9),3,3) ;

      % score homography
      X2_ = H{t} * X1 ;

      du = X2_(1,:)./X2_(3,:) - X2(1,:)./X2(3,:) ;
      dv = X2_(2,:)./X2_(3,:) - X2(2,:)./X2(3,:) ;
      ok{t} = (du.*du + dv.*dv) < 6*6 ;
      score(t) = sum(ok{t}) ;

    end

    [score, best] = max(score) ;
    H = H{best} ;
    ok = ok{best} ;

if (sum(ok)/numMatches)*100 < threshold
    mosaic = im1; 
    disp('Fails same page test');
    index_mismatch = [index_mismatch n];
else 
   [mosaic,H]= stitch_mosaic(im1,f1,im2,f2,matches,numMatches,ok,H);
end
end
