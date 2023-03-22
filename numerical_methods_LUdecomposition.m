%Enter [r] in row vector form
%This method is invalid for systems with zero or infinite solutions
%The number of equations must be equal to the number of variables
%[D] and [x] are stored as column vectors
%sample A = [3 -0.1 -0.2;0.1 7 -0.3;0.3 -0.2 10]
%sample r = [7.85 -19.3 71.4]

clc
clear all
%% Initialization
disp('Solution of N-equation "[A][X]=[r]"') %displays the main matrix equation
n=input ('Enter number of Equations :');
A=input ('Enter Matrix [A]:'); %Coefficient matrix
r=input ('Enter Matrix [r]:'); %matrix of constants
U=A;
L=zeros(n,n);
for i=1:3
    L(i,i)=1; %makes all diagonal elements 1
end
if n~=size(A,1) || n~=size(A,2) %checks validity of input
    disp('The system has zero or infinite solutions. The process will be terminated');
    return
end

%% LU Decomposition
s=0; %row count for forward elimination
for j=1:n-1
    %% Pivoting to avoid division by zero
    if U(j,j)==0 % looks for 0 in the pivot coefficient
        k=j;
        for k=k+1:n
            if U(k,j)==0 % looks for any other zeros
                continue %goes into the next iteration ignoring any following commands
            end
            break
        end
        % replacing the pivot equation
        B=U(j,:); C=r(j);
        U(j,:)=U(k,:); r(j)=r(k);
        U(k,:)=B; r(k)=C;
    end
    
    %% Determining [U] and [L] by forward elimination
    for i=1+s:n-1
        f=U(i+1,j)/U(j,j); %division by pivot coefficient
        U(i+1,:)=U(i+1,:)-f*U(j,:); %subtract according to the theorem
        L(i+1,j)=f; %stores factor f in [L]
    end
    s=s+1;
end

 %% Determining intermediate vector [D] by forward substitution
for i=1:n
    sum=0;
    for j=1:i-1
        sum=sum+L(i,j)*D(j,1); %sum of terms excluding D(i,1) and r(i)
    end
    D(i,1)=r(i)-sum; %eq 10.12
end

%% Determining solution [x] by backward substitution
x(n,1)=D(n,1)/U(n,n); %eq 10.13
for i=n-1:-1:1 %i decreases with every iteration
    sum=0;
    for j=i+1:n
        sum=sum+U(i,j)*x(j,1); %sum of terms excluding U(i,i)*x(i,1) and D(i,1)
    end
    x(i,1)=(1/U(i,i))*(D(i,1)-sum); %eq 10.14
end

%% Displaying results
disp('Output [U][x]=[D]')
disp('Upper triangular matrix [U] =');disp(U);
disp('Lower diagonal matrix [L] =');disp(L);
disp('Solution of linear equations [x] =');disp(x);
