#reference genome: labrus bergylta
#S. ocellatus vs S. tinca: total markers
matrix1<-matrix(c(512,423,4772,3562),nrow=2)
matrix1
fisher.test(matrix1)

matrix2<-matrix(c(420,352,92,71),nrow=2)
matrix2
fisher.test(matrix2)

matrix3<-matrix(c(261,206,159,146),nrow=2)
matrix3
fisher.test(matrix3)

matrix4<-matrix(c(66,61,195,145),nrow=2)
matrix4
fisher.test(matrix4)

#S. ocellatus vs S. tinca: candidate markers

matrix5<-matrix(c(11,26,157,266),nrow=2)
matrix5
fisher.test(matrix5)

matrix6<-matrix(c(9,22,2,4),nrow=2)
matrix6
fisher.test(matrix6)

matrix7<-matrix(c(7,16,2,6),nrow=2)
matrix7
fisher.test(matrix7)

matrix8<-matrix(c(3,3,4,13),nrow=2)
matrix8
fisher.test(matrix8)

  #for matrixs 6, 7 and 8 we need to do the Fisher's test because we have values lower than 5. 

fisher.test(matrix6)
fisher.test(matrix7)
fisher.test(matrix8)

#S. ocellatus: total vs. candidate markers

matrix9<-matrix(c(26,423,266,3562),nrow=2)
matrix9
fisher.test(matrix9)

matrix10<-matrix(c(22,352,4,71),nrow=2)
matrix10
fisher.test(matrix10)
fisher.test(matrix10)

matrix11<-matrix(c(16,206,6,146),nrow=2)
matrix11
fisher.test(matrix11)

matrix12<-matrix(c(3,61,13,145),nrow=2)
matrix12
fisher.test(matrix12)
fisher.test(matrix12)


#S. tinca: total vs. candidate markers

matrix13<-matrix(c(11,512,157,4772),nrow=2)
matrix13
fisher.test(matrix13)

matrix14<-matrix(c(9,420,2,92),nrow=2)
matrix14
fisher.test(matrix14)
fisher.test(matrix14)

matrix15<-matrix(c(7,261,2,159),nrow=2)
matrix15
fisher.test(matrix15)
fisher.test(matrix15)

matrix16<-matrix(c(3,66,4,195),nrow=2)
matrix16
fisher.test(matrix16)
fisher.test(matrix16)




#reference genome: Stongylocentrotus purpuratus
#A. lixula vs. P. lividus: total markers
matrix24<-matrix(c(174,342,5067,3388),nrow=2)
matrix24
fisher.test(matrix24)

matrix25<-matrix(c(88,242,86,100),nrow=2)
matrix25
fisher.test(matrix25)

matrix30<-matrix(c(199,63,43,25),nrow=2)
matrix30
fisher.test(matrix30)

matrix26<-matrix(c(49,183,14,16),nrow=2)
matrix26
fisher.test(matrix26)

#A. lixula vs. P. lividus: candidate markers
matrix27<-matrix(c(6,30,258,372),nrow=2)
matrix27
fisher.test(matrix27)
fisher.test(matrix27)

matrix28<-matrix(c(2,21,4,9),nrow=2)
matrix28
fisher.test(matrix28)
fisher.test(matrix28)

matrix32<-matrix(c(1,17,1,4),nrow=2)
matrix32
fisher.test(matrix32)
fisher.test(matrix32)

matrix31<-matrix(c(1,14,0,3),nrow=2)
matrix31
fisher.test(matrix31)
fisher.test(matrix31)



#P.lividus total markers vs candidates markers

matrix34<-matrix(c(342,30,3388,372),nrow=2)
matrix34
fisher.test(matrix34)

matrix35<-matrix(c(242,21,100,9),nrow=2)
matrix35
fisher.test(matrix35)

matrix36<-matrix(c(199,17,43,4),nrow=2)
matrix36
fisher.test(matrix36)
fisher.test(matrix36)

matrix37<-matrix(c(183,14,16,3),nrow=2)
matrix37
fisher.test(matrix37)
fisher.test(matrix37)

#A.lixula total markers vs. candidates markers
matrix38<-matrix(c(174,6,5067,258),nrow=2)
matrix38
fisher.test(matrix38)
fisher.test(matrix38)

matrix39<-matrix(c(88,2,86,4),nrow=2)
matrix39
fisher.test(matrix39)
fisher.test(matrix39)

matrix40<-matrix(c(63,1,25,1),nrow=2)
matrix40
fisher.test(matrix40)
fisher.test(matrix40)

matrix41<-matrix(c(78,1,22,0),nrow=2)
matrix41
fisher.test(matrix41)
fisher.test(matrix41)

#P.lividus exons-introns vs. S.ocellatus and S.tinca
#total
matrix42<-matrix(c(183,61,16,145),nrow=2)
matrix42
fisher.test(matrix42)

matrix43<-matrix(c(183,66,16,195),nrow=2)
matrix43
fisher.test(matrix43)

#candidates
matrix44<-matrix(c(14,3,3,13),nrow=2)
matrix44
fisher.test(matrix44)
fisher.test(matrix44)

matrix45<-matrix(c(14,3,3,4),nrow=2)
matrix45
fisher.test(matrix45)
fisher.test(matrix45)

#Comparison of fish vs sea urchins of total loci
matrix46<-matrix(c(423,512,342,174,3562,4772,3388,5067),nrow=4)
matrix46
chisq.test(matrix46)

matrix47<-matrix(c(352,420,242,88,71,92,100,86),nrow=4)
matrix47
chisq.test(matrix47)

matrix48<-matrix(c(206,261,199,63,146,159,43,25),nrow=4)
matrix48
chisq.test(matrix48)

matrix49<-matrix(c(61,66,183,49,145,195,16,14),nrow=4)
matrix49
chisq.test(matrix49)

#Comparison of fish vs sea urchins of total loci without a.lixula
matrix50<-matrix(c(423,512,342,3562,4772,3388),nrow=3)
matrix50
chisq.test(matrix50)

matrix51<-matrix(c(352,420,242,71,92,100),nrow=3)
matrix51
chisq.test(matrix51)

matrix52<-matrix(c(206,261,199,146,159,43),nrow=3)
matrix52
chisq.test(matrix52)

matrix53<-matrix(c(61,66,183,145,195,16),nrow=3)
matrix53
chisq.test(matrix53)

