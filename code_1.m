%% 导入图像
clear;clc;
path_part='xxx\附件1\';  %%这里为附件1存放的地址
all_cell={};% 创建0*0的元胞
n=19; %多少个
for i=1-1:n-1
    if i<10
        path_all=[path_part,'00',int2str(i),'.bmp'];
    else
        path_all=[path_part,'0',int2str(i),'.bmp'];
    end
    a=imread(path_all);
    all_cell(i+1)={double(a)};
end
temp=size(a)
col=temp(1)
row=temp(2)

%% 寻找最左边
for i=1:n
    pd=1;
    for j=1:col
        if all_cell{1,i}(j,1)~=255 
            pd=0;
        end
    end
   if pd==1
      first_number=i; 
   end
end

%% 比较每个图像左右两边像数值相等的个数

for i=1:n
   for j=1:n
       fig_sim(i,j)=0;
       if i~=j
           for k=1:col
               % 判断左右像素值是否相等
               if  all_cell{1,i}(k,72)==all_cell{1,j}(k,1)
                   fig_sim(i,j)=fig_sim(i,j)+1;
               end
          end
       end
   end
end

%% 排序 每个纸片的顺序
niber=max(fig_sim.');
shunxu(1)=first_number;

for j=1:n-1
    for i=1:n
        if niber(shunxu(j))==fig_sim(shunxu(j),i)
            shunxu(j+1)=i; 
        end
    end
end

%% test
% for i=1:n
%     for j=1:n
%         if niber(j)==fig_sim(j,i)
%             fprintf("第%d个与%d个纸片拼接\n",i,j);
%         end
%     end
% 
% end

%% 拼接
% new_all=(1980,1980);
% sunxu=[9,15,13,16,4,11,3,17,2,5,6,10,14,19,12,8,19,1,7];
for i=1:n
    for j=1:col
        for k=1:row
            new_all(j,(i-1)*row+k)=all_cell{1,shunxu(i)}(j,k); 
        end
 
    end
   
end
imshow(uint8(new_all))
