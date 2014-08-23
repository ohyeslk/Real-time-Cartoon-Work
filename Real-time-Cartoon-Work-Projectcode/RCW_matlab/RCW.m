%%%%%%%%%%%%%%%%%%%%%%%%%    Դͼ��    %%%%%%%%%%%%%%%%%%%%%%%%%%
%output:imsize(x,y),[rgb]
origin=imread('C:\Users\Administrator\Desktop\thesis\pic\2.jpg');
[rgb]=imread('C:\Users\Administrator\Desktop\thesis\pic\2.jpg')%��ȡԴͼ��rgb
imsize = size(origin);%��ȡԴͼ�񳤡���
figure,imshow(origin),title('Դͼ��')

%%%%%%%%%%%%%%%%%%%%%%%%%%    ��Ȩ��ǿ    %%%%%%%%%%%%%%%%%%%%%%%%%%
%
rgbehc(:,:,1)=1.3*rgb( : , : ,1);
rgbehc(:,:,2)=1.4*rgb( : , : ,2);
rgbehc(:,:,3)=1.3*rgb( : , : ,3);
%figure,imshow(rgbehc),title('��Ȩ��ǿ');
imwrite(rgbehc,'C:\Users\Administrator\Desktop\thesis\pic\2_1.jpg')
ehc=imread('C:\Users\Administrator\Desktop\thesis\pic\2_1.jpg')
%%%%%%%%%%%%%%%%%%%%%%%%%%    ������    %%%%%%%%%%%%%%%%%%%%%%%%%%
%��˹����
noise=imnoise(origin,'gaussian')%������
figure,imshow(noise),title('����ͼ��')

%%%%%%%%%%%%%%%%%%%%%%%%%%    ��ֵ��    %%%%%%%%%%%%%%%%%%%%%%%%%%
%input:rgbehc(:,:,:)   output:bin(:,:,:)
bin = zeros(imsize);%����0����
for x=1:imsize(1)
    for y=1:imsize(2)
if rgbehc(x, y, :)<=125 %��ֵ
    bin(x,y,:)=0;
  else
    bin(x,y,:)=255;
       end
    end
end
bin = uint8(bin);
figure,imshow(bin),title('��ֵ��')

%%%%%%%%%%%%%%%%%%%%%%%%%%    ɫ�ʼ�    %%%%%%%%%%%%%%%%%%%%%%%%%%
%input:rgbehc(:,:,:)   output:colsim(:,:,:)
colsim = zeros(imsize);%����0����
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
figure,imshow(colsim),title('ɫ�ʼ�')

%%%%%%%%%%%%%%%%%%%%%%%%%%    sobel��Ե���    %%%%%%%%%%%%%%%%%%%%%%%%%%
%input:ehc   output:edgdtc

x_mask=[-1 0 1;
       -2 0 2;
       -1 0 1];
y_mask=rot90(x_mask);
I=im2double(ehc);
dx=imfilter(I,x_mask); % ����X������ݶȷ���
dy=imfilter(I,y_mask); % ����y������ݶȷ���
grad=sqrt(dx.*dx+dy.*dy);%�����ݶ�
grad=mat2gray(grad);%����һ�������ݶȾ����Ϊ�Ҷ�ͼ��
level=graythresh(grad);%�Զ��ҵ���ֵ
edgdtc=im2bw(grad,level);
imwrite(~edgdtc,'C:\Users\Administrator\Desktop\thesis\pic\2_1_1.jpg')
figure,imshow(~edgdtc),title('��Ե���')

%%%%%%%%%%%%%%%%%%%%%%%%%%    ͼ�����    %%%%%%%%%%%%%%%%%%%%%%%%%%
%input:colsim,rgbedge   output:add
[rgbedge]=imread('C:\Users\Administrator\Desktop\thesis\pic\2_1_1.jpg')
add = zeros(imsize);
for x=1:imsize(1)
    for y=1:imsize(2)
if rgbedge(x, y, :)<=100%��ֵ��100  ���ӱʴ�������
    add(x,y,:)=0;
  else
    add(x,y,:)=colsim(x,y,:);%��ͼ
       end
    end
end
add = uint8(add);
figure,imshow(add),title('ͼ�����')

