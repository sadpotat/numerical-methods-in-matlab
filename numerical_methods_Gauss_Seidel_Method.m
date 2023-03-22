%The code provided in the lab may not give proper results if the input
%sets are not diagonally dominant. The following fixes this problem
%A=[0.1 7 -0.3; 0.3 -0.2 10; 3 -0.1 -0.2]
%b=[-19.3 71.4 7.85]

clc
clear all

%% Initialization
A=input('Enter matrix [A]: ');
b=input('Enter matrix [b]: ');
tol=input('maximum approximated error :');
n=size(A,1);
x=rand(n,1);
normVal=Inf;
GaussItr=0;
piv=zeros(1,n);

%% Checks validity of input
if size(A,1)~=size(A,2) || size(b,2)~=size(A,2)
    disp('The system has zero or infinite solutions. The process will be terminated');
    return
end

%% Position of potential pivot elements in ith rows
for i=1:n
    pivot=0;
    sumothers=0;
    for j=1:n
        if abs(A(i,j))==max(abs(A(i,:)))
            pivot=abs(A(i,j));
            k=j;
        else
            sumothers=sumothers+abs(A(i,j));
        end
    end
    if pivot>sumothers
       piv(k)=i; 
    end
end

%% Checks for diagonal dominance
if ismember(0,piv)
    disp('Diagonal dominance is not possible. The process will be terminated');
    return
end

%% Interchanges rows to achieve diagonal dominance
for i=1:n
    newA(i,:)=A(piv(i),:);
    newb(i)=b(piv(i));
end
A=newA; b=newb;

%% Algorithm: Gauss Seidel Method
while normVal>tol
    x_old=x;
    for i=1:n
        sigma=0;
        for j=1:i-1
            sigma=sigma+A(i,j)*x(j);
        end
        for j=i+1:n
            sigma=sigma+A(i,j)*x_old(j);
        end
        x(i)=(1/A(i,i))*(b(i)-sigma);
    end
    GaussItr=GaussItr+1;
    normVal=norm(x_old-x);
end
fprintf('In %d iterations, solution of the system is x=  \n',GaussItr);disp(x);