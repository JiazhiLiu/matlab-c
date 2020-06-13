% 如果提示缺少共享依赖库，就把相应的库放在当前文件夹下
% Notice: first use "mex -setup" to choose your c/c++ compiler
clear, clear

is_64bit = strcmp(computer,'MACI64') || strcmp(computer,'GLNXA64') || strcmp(computer,'PCWIN64');
 
 

out_dir='./';
includePath = [' -I' 'C:\software\opencv\opencv\build\include'];
libFolderPath = [' -L' 'C:\software\opencv\opencv\build\x64\vc14\lib'];
libPath = [' -lopencv_world3410.lib' ' -lopencv_world3410d.lib'];
if is_64bit
    API = ' -largeArrayDims';
end


compile_files = { 
	% the list of your code files which need to be compiled
	'rgb2gray00.cpp'
};
 
 
for k = 1 : length(compile_files)
    str = compile_files{k};
    fprintf('compilation of: %s\n', str);
    str = [str ' -outdir ' out_dir includePath API libFolderPath libPath];
    args = regexp(str, '\s+', 'split');
    mex(args{:});
end
 
fprintf('Congratulations, compilation successful!!!\n');