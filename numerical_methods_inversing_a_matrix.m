%The input must be a 3x3 matrix
%[r], [D] are column vectors
%sample A = [3 -0.1 -0.2;0.1 7 -0.3;0.3 -0.2 10]

clc
clear all

A=input ('Enter Matrix [A]:');
Ain=zeros(3,3);
I=eye(3,3);
U=A;
L=zeros(3,3);
for i=1:3
    L(i,i)=1; 
end
if size(A,1)~=3 || size(A,2)~=3 %checks if [A] is a 3x3 matrix
    disp('The input is not a 3x3 matrix. The process will be terminated');
    return
end

s=0; 
for j=1:2
    
    % Determining [U] and [L] by forward elimination
    for i=1+s:2
        f=U(i+1,j)/U(j,j); %division by pivot coefficient
        U(i+1,:)=U(i+1,:)-f*U(j,:); %subtract according to the theorem
        L(i+1,j)=f; 
    end
    s=s+1;
end

for k=1:3
    % Determining intermediate vector [D] by forward substitution
    r=I(:,k);
    for i=1:3
        sum=0;
        for j=1:i-1
            sum=sum+L(i,j)*D(j,1);
        end
        D(i,1)=r(i,1)-sum; %eq 10.12
    end
    
    % Determining kth column of Ain by backward substitution
    Ain(3,k)=D(3,1)/U(3,3); %eq 10.13
    for i=2:-1:1
        sum=0;
        for j=i+1:3
            sum=sum+U(i,j)*Ain(j,k);
        end
        Ain(i,k)=(1/U(i,i))*(D(i,1)-sum); %eq 10.14
    end
end

% Displaying results
disp('Inverse matrix inv[A] =');disp(Ain);
