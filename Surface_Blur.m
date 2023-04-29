function I_out=Surface_Blur(I_in, radi, thre)

[r, c,dim]=size(I_in);
I_out=I_in;
h_time=waitbar(0);
    for ii=1+radi : r-radi
        str=['   ',num2str(round((ii/(r-radi)*100))),'%'];
        waitbar(ii/(r-radi),h_time,str);
        for jj=1+radi : c-radi
            for rgb=1:3
                patch=I_in (ii-radi:ii+radi, jj-radi:jj+radi,rgb);
                p0=I_in(ii, jj,rgb);
                mask_1= repmat(p0, 2*radi+1, 2*radi+1);
                mask_2=1-abs(patch-mask_1)/(2.5*thre);
                mask_3=max(mask_2,0);
                I_out(ii, jj,rgb)=sum(sum(patch.*mask_3))/sum(mask_3(:));
        end    
    end
end

delete(h_time);