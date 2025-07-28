library(ggplot2)
X=read.table('pdf.txt',header=TRUE)

# plot pdfs
ggplot(X,aes(x=x))+
  geom_line(aes(y=exp(y1)),col='red')+
  geom_line(aes(y=exp(y2)),col='pink')+
  geom_line(aes(y=exp(y3)),col='orange')+
  geom_line(aes(y=exp(y4)),col='blue')+
  theme_bw()

# Verify pdf integrates to 1 on [0;2pi), i.e. to 2 here on [0;4pi)
dx=mean(diff(X$x))
sum(exp(X$y1)*dx)
sum(exp(X$y2)*dx)
sum(exp(X$y3)*dx)
sum(exp(X$y4)*dx)

