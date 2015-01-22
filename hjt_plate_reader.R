##Just change the directory and add your file with the name example.csv
#Note I saved the excel sheet as a csv
dir<-"S:\\Genomics\\Molbio_Users\\BEF\\brian_fleharty\\bef22"
setwd(dir)
my.file<-read.delim("example.csv",sep=",",head=F,skip=0,as.is=T)
plate.numb<-nrow(my.file)/9
mat1<-matrix(NA,nrow=96,ncol=plate.numb)
for (j in 1: plate.numb)
{
for(i in 1:12)
{
mat1[((8*(i-1))+1):(i*8),j]<- my.file[((9*(j-1))+2):(j*9),i+1]
}
}   
my.file
mat1
position<-c("A1","B1","C1","D1","E1","F1","G1","H1","A2","B2","C2","D2","E2","F2","G2","H2","A3","B3","C3","D3","E3","F3","G3","H3","A4","B4","C4","D4","E4","F4","G4","H4","A5","B5","C5","D5","E5","F5", "G5","H5","A6","B6","C6","D6","E6","F6","G6","H6","A7","B7","C7","D7","E7","F7","G7","H7","A8","B8","C8","D8","E8","F8","G8","H8","A9","B9","C9","D9","E9","F9",
"G9","H9","A10" ,"B10" ,"C10" ,"D10","E10", "F10", "G10", "H10" ,"A11", "B11", "C11", "D11" ,"E11" ,"F11", "G11", "H11", "A12", "B12", "C12", "D12", "E12" ,"F12", "G12", "H12")

mat2<-cbind(position,mat1,deparse.level = 0)


mat3<-matrix(NA,nrow=1,ncol=plate.numb)

for (i in 1: plate.numb)

{
mat3[,i]<-i
}

paste("plate",mat3)

mat4<-rbind(c("position",paste("plate",mat3)),mat2,deparse.level = 0)

write.table(mat4,file=paste(dir,"\\my_plates_by_column",".txt",sep=""), sep="\t",col.names=F,row.names = F)
my.file
mat2
##