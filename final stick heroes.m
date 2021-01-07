pkg load image
while 1
 system('adb shell screencap -p /storage/emulated/0/screen.png');
 system('adb pull /storage/emulated/0/screen.png');
a=imread("C:/Users/Hp/screen.png");
b=imcrop(a,[0.5 809.5 719.5 2]);
c=imcrop(a,[0.5 776 718 2]);
[y2,x2]=find(b==247);
[y1,x1]=find(c==255);
p1=numel(x2);
q1=numel(x1);
p=uint16(p1/2);
q=uint16(q1/2);
if(p==0)
p=p+1;
endif
if(q==0)
q=q+1;
endif 
ans2=x2(p);
ans1=x1(q);
if(ans1>720)
ans1=x1(1);
endif
if(ans2>720)
ans2=x2(1);
endif
ans1=ans1+10;
ans=ans2-ans1;
t1=ans/0.7104;
t=uint16(t1);
str='adb shell input touchscreen swipe 200 400 200 400 ';
s=int2str(t);
str1=[str,s];
d=char(str1);
system(str1);
system('adb shell rm -f /storage/emulated/0/screen.png');
system('del /f C:/Users/Hp/screen.png');
pause(4);
endwhile
