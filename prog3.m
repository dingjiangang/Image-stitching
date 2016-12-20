clc
close all

% Run and setup the required libraries if not already installed
run('vlfeat-0.9.20/toolbox/vl_setup.m');

% --------------------------------------------------------------------
%                                                          Load images
% --------------------------------------------------------------------

% Get list of all JPG files in this directory  DIR returns as a structure array.

imagefiles = dir('*.JPG');      
nfiles = length(imagefiles);    % Number of files found
  
% Loading all input images in the cell 'images'

images = cell(1,nfiles);

for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   currentimage = imread(currentfilename);
   images(1,ii) = {currentimage};
end

im_size = size(currentimage);


% Initialize the mosaic as the first image. If a different image is to be
% used as reference to make the mosaic, then this will have to be set to
% that image.

% Create mosaic. One the first run of the loop, it takes in the first and 
% second image, gives us a mosaic of those
% two images. Then on the second run it takes in the mosaic created from
% the first two images and the third image and the output will be the
% mosaic of those images. This will run continuously till all the images in
% the folder are exhausted.

% Create list of all Homography matrices

 H_list= cell(nfiles-1,3);
% 
index_mismatch= [];

mosaic = images{1,1};
% --------------------------------------------------------------------
%                                                   Run same page test
% --------------------------------------------------------------------

for n = 2: nfiles
  
     [mosaic_out,H,index_mismatch] = same_page_test(mosaic,images{1,n},index_mismatch,n);
     mosaic = imresize(mosaic_out, [im_size(1) im_size(2)]);
      H_list(n-1,1) = {H};
      H_list(n-1,2) = {1} ;
      H_list(n-1,3) = {n} ;
    %filename = sprintf('output_mosaic_%d.png',n-1);
    %imwrite(mosaic,filename,'png');
end

figure(1);
imshow(mosaic)
