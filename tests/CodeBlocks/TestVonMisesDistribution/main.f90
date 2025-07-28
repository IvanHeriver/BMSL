
program hello
    use kinds_dmsl_kit
    use Distribution_tools
    use utilities_dmsl_kit,only:pi
    implicit none

    integer(mik),parameter::n=1000
    real(mrk)::x(n+1),y1,y2,y3,y4,par1(2),par2(2),par3(2),par4(2)
    logical::feas,isnull
    integer(mik)::err,i
    character(250)::mess

    x=(/ ((4._mrk*pi*real(i,mrk))/real(n,mrk),i=0,n) /)

    par1=(/1._mrk,1._mrk/)
    par2=(/1._mrk,0.2_mrk/)
    par3=(/1._mrk,10._mrk/)
    par4=(/6._mrk,1._mrk/)
    open(unit=1,file='pdf.txt',status='replace')
    write(1,'(5A14)') 'x','y1','y2','y3','y4'
    do i=1,n
        call GetPdf(DistId='VonMises',x=x(i),par=par1,pdf=y1,&
                    loga=.true.,feas=feas,isnull=isnull,err=err,mess=mess)
        call GetPdf(DistId='VonMises',x=x(i),par=par2,pdf=y2,&
                    loga=.true.,feas=feas,isnull=isnull,err=err,mess=mess)
        call GetPdf(DistId='VonMises',x=x(i),par=par3,pdf=y3,&
                    loga=.true.,feas=feas,isnull=isnull,err=err,mess=mess)
        call GetPdf(DistId='VonMises',x=x(i),par=par4,pdf=y4,&
                    loga=.true.,feas=feas,isnull=isnull,err=err,mess=mess)
        write(1,'(5F14.6)') x(i),y1,y2,y3,y4
    enddo
    close(1)
end program

