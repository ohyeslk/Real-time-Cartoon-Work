%%%%%%%%%%%%%%%%%%%%%%%%%    源图像    %%%%%%%%%%%%%%%%%%%%%%%%%%
%output:imsize(x,y),[rgb]
origin=imread('C:\Users\Administrator\Desktop\thesis\pic\2.jpg');
[rgb]=imread('C:\Users\Administrator\Desktop\thesis\pic\2.jpg')%获取源图像rgb
imsize = size(origin);%获取源图像长、宽
figure,imshow(origin),title('源图像')
rgbehc=rgb;
%%%%%%%%%%%%%%%%%%%%%%%%%%    色彩简化    %%%%%%%%%%%%%%%%%%%%%%%%%%
%input:rgbehc(:,:,:)   output:colsim(:,:,:)
colsim = zeros(imsize);%建立0矩阵
for x=2:imsize(1)-1
    for y=2:imsize(2)-1
        for z=1:1:3
     if rgbehc(x, y, z)<50&&rgbehc(x, y, z)>=0
    colsim(x,y,z)=25;
    elseif rgbehc(x, y, z)<100&&rgbehc(x, y, z)>=50
    colsim(x,y,z)=75;
    elseif rgbehc(x, y, z)<150&&rgbehc(x, y, z)>=100
    colsim(x,y,z)=125;
       elseif rgbehc(x, y, z)<200&&rgbehc(x, y, z)>=150
    colsim(x,y,z)=175;
       elseif rgbehc(x, y, z)<=255&&rgbehc(x, y, z)>=200
    colsim(x,y,z)=225;
       end
    end
    end
end
colsim = uint8(colsim);
figure,imshow(colsim),title('色彩简化')

%%%%%%%%%%%%%%%%%%%%%%%%%%    sobel边缘检测    %%%%%%%%%%%%%%%%%%%%%%%%%%
%input:ehc   output:edgdtc
x_mask=[-1 0 1;
       -2 0 2;
       -1 0 1];
y_mask=rot90(x_mask);
I=im2double(rgbehc);
dx=imfilter(I,x_mask); % 计算X方向的梯度分量
dy=imfilter(I,y_mask); % 计算y方向的梯度分量
grad=sqrt(dx.*dx+dy.*dy);%计算梯度
grad=mat2gray(grad);%（归一化）将梯度矩阵变为灰度图像
level=graythresh(grad);%自动找到阈值
edgdtc=im2bw(grad,level);
imwrite(~edgdtc,'C:\Users\Administrator\Desktop\thesis\pic\2_1.jpg')
figure,imshow(~edgdtc),title('边缘检测')

%%%%%%%%%%%%%%%%%%%%%%%%%%    sobel边缘检测    %%%%%%%%%%%%%%%%%%%%%%%%%%
%input:ehc   output:edgdtc
x_mask=[-1 0 1;
       -2 0 2;
       -1 0 1];
y_mask=rot90(x_mask);
I=im2double(rgbehc);
dx=imfilter(I,x_mask); % 计算X方向的梯度分量
dy=imfilter(I,y_mask); % 计算y方向的梯度分量
grad=sqrt(dx.*dx+dy.*dy);%计算梯度
grad=mat2gray(grad/4);%（归一化）将梯度矩阵变为灰度图像
level=graythresh(grad);%自动找到阈值
edgdtc2=im2bw(grad,level);
imwrite(~edgdtc2,'C:\Users\Administrator\Desktop\thesis\pic\2_1_1.jpg')
figure,imshow(~edgdtc2),title('边缘检测2')
%%%%%%%%%%%%%%%%%%%%%%%%%%    图像叠加    %%%%%%%%%%%%%%%%%%%%%%%%%%
%input:colsim,rgbedge   output:add
[rgbedge]=imread('C:\Users\Administrator\Desktop\thesis\pic\2_1.jpg')
add = zeros(imsize);
for x=1:imsize(1)
    for y=1:imsize(2)
if rgbedge(x, y, :)<=100%阈值是100  增加笔触往上升
    add(x,y,:)=0;
  else
    add(x,y,:)=colsim(x,y,:);%彩图
       end
    end
end
add = uint8(add);
figure,imshow(add),title('图像叠加')

