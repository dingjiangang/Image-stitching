# Image-stitching
Name : Mrinal Joshi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

List of submitted items
1. main
2. demo (folder)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Contents :
1. prog3.m
2. same_page_test.m (function)
3. stitch_mosaic.m (function)
3. vlfeat-0.9.20 (library that needs to be in the same folder as the code)
4. README.txt

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Contents of demo (folder) :
3. kohn
i. input images in ‘input’ folder
ii. final mosaic
4. graffiti
i. input images in ‘input’ folder
ii. final mosaic
iii. a screenshot showing the message ‘fails same page test’
5. marine
i. input images in ‘input’ folder
ii. final mosaic
6. door
i. input images in ‘input’ folder
ii. final mosaic

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Instructions to run the code :

1. Run ‘prog3.m’
2. The mosaic output image and intermediate mosaics will be created in the same folder
3. The input image files have to be in the same folder as .m files 
4. vlfeat-0.9.20 folder should be in the same folder as the code

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Bonus:

1. Works with random input sequence. In the demo folder are four examples to illustrate this. The inputs are in no particular order. 

2. Implements same page test first: Checks if there is an image which is totally unrelated to the rest of the set and skips that particular image. Example of this shown in the ‘graffiti’ folder under the demo folder. One of the inputs is unrelated which is skipped in the final mosaic. There is a threshold parameter in the same_page_test which is a threshold on number of inlier percentage. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Problems/ Future developments:

1. Does not work for 360 degree panorama. 
2. At times, there is distortion for large number of input images. Always works till 5-6 images. I realized the problem. I think the problem is the error accumulation of translation matrices. 
2. Mosaic keeps tapering. Should resize after every image has been mosaicked.
