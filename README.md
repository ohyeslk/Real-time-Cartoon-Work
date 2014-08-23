Real-time-Cartoon-Work
======================

Real-time-Cartoon-Work (FPGA Design) 
PROJECT: Real-time Cartoon Work 04/2013- 08/2013 
Description: Won Second prize in Altera Innovate Asia 2013 FPGA Design Contest. Student Training Innovation Programs 

We first use MATLAB code to realize its prototype, and then implement it in FPGA Develop Kit.


In this paper, a real-time cartoon work for video
effect and entertainment based on FPGA is presented. Users are
able to produce a cartoon effect video at once instead of using
Photoshop to process it. The design approach of this system
consists of four major parts. First, collect video information from
the camera or DV and transfer to the RGB format. Second, use
bold edges and color simplification to create cartoon-like video of
real world, approaches here includes Gaussian filter, edge
detection, timer/space average and color simplification. Third,
the cartoon-like images could also be stored in the SD card
controlled by SPI bus written in verilog HDL. Forth, the stored
images and original video feed could be displayed in the monitor
with a picture in picture effect. Our system implements the idea
on Altera-DE2 board and provides a flexible device to produce
cartoon style video or picture in real- time.

Responsibility:
(1)Realized FPGA control on SDRAM, SRAM and Decoder Chip to capture video, and switched it to RGB.
(2) Wrote Verilog HDL of image processing algorithms to turn video into cartoon style(Gaussian filter and intensity
calculator to smooth noise, Sobel operator to detect edges, RGB switch to HSL)
(3) Achieved SPI communication between FPGA and SD card, storing image and video into SD card.
(4) Calculated factors influence on image process, got optimal solution and achieved PIP display on VGA
