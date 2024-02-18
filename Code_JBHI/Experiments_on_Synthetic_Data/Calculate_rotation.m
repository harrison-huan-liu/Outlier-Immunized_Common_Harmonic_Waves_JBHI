function RotationMatrix=Calculate_rotation(Theta,u)
a=cos(1/2*Theta);
b=sin(1/2*Theta)*u(1);
c=sin(1/2*Theta)*u(2);
d=sin(1/2*Theta)*u(3);
RotationMatrix=[1-2*c*c-2*d*d,2*b*c-2*a*d,2*a*c+2*b*d;2*b*c+2*a*d,1-2*b*b-2*d*d,2*c*d-2*a*b;2*b*d-2*a*c,2*a*b+2*c*d,1-2*b*b-2*c*c];
end