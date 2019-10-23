android.googlesource.com.$DT.heads
bioconductor.org.$DT.heads
bitbucket$DT.new.0.heads
bitbucket$DT.new.1.heads
bitbucket$DT.new.2.heads
bitbucket$DT.new.3.heads
bitbucket$DT.new.4.heads
bitbucket$DT.new.5.heads
bitbucket$DT.new.6.heads
bitbucket$DT.new.7.heads
bitbucket$DT.new.8.heads
cgit.kde.org.$DT.heads
drupal.com.heads
gh$DT.u.10.heads
gh$DT.u.11.heads
gh$DT.u.12.heads
gh$DT.u.13.heads
gh$DT.u.14.heads
gh$DT.u.15.heads
gh$DT.u.16.heads
gh$DT.u.17.heads
gh$DT.u.18.heads
gh$DT.u.19.heads
gh$DT.u.20.heads
gh$DT.u.21.heads
gh$DT.u.22.heads
gh$DT.u.23.heads
gh$DT.u.24.heads
gh$DT.u.25.heads
gh$DT.u.26.heads
gh$DT.u.27.heads
gh$DT.u.28.heads
gh$DT.u.29.heads
git.debian.org.$DT.0.heads
git.eclipse.org.$DT.heads
git.kernel.org.$DT.heads
git.postgresql.org.$DT.heads
git.savannah.gnu.org.$DT.heads
git.zx2c4.com.$DT.heads
gitlab.gnome.org.$DT.heads
gl$DT.new.heads
repo.or.cz.$DT.heads


for f in sf$DT.prj.new.heads repo.or.cz.$DT.heads gl$DT.new.heads gitlab.gnome.org.$DT.heads git.zx2c4.com.$DT.heads git.savannah.gnu.org.$DT.heads git.postgresql.org.$DT.heads git.kernel.org.$DT.heads git.eclipse.org.$DT.heads cgit.kde.org.$DT.heads bioconductor.org.$DT.heads android.googlesource.com.$DT.heads git.postgresql.org.$DT.heads; 
do zcat $f | grep -v 'could not connect' | \
	 perl -ane 'chop(); ($u, @h) = split (/\;/, $_, -1); for $h0 (@h){print "$h0;$#h;$u\n" if $h0=~m|^[0-f]{40}$|}' | \
	 ssh da4 ~/bin/hasObj1.perl commit | cut -d\; -f3 | uniq > $f.get 
done

for i in {00..29}
do f=gh$DT.u.$i.heads
	zcat $f | grep -v 'could not connect' | \
	perl -ane 'chop(); ($u, @h) = split (/\;/, $_, -1); for $h0 (@h){print "$h0;$#h;$u\n" if $h0=~m|^[0-f]{40}$|}' | \
	ssh da4 ~/bin/hasObj1.perl commit | cut -d\; -f3 | uniq 
done > gh$DT.u.heads.get

for i in {0..8} 
do f=bitbucket$DT.new.$i.heads
	zcat $f | grep -v 'could not connect' | \
	perl -ane 'chop(); ($u, @h) = split (/\;/, $_, -1); for $h0 (@h){print "$h0;$#h;$u\n" if $h0=~m|^[0-f]{40}$|}' | \
	ssh da4 ~/bin/hasObj1.perl commit | cut -d\; -f3 | uniq 
done > bitbucket$DT.new.heads.get

				
for i in {0..9}
do f=git.debian.org.$DT.$i.heads
	zcat $f | grep -v 'could not connect' | \
	perl -ane 'chop(); ($u, @h) = split (/\;/, $_, -1); for $h0 (@h){print "$h0;$#h;$u\n" if $h0=~m|^[0-f]{40}$|}' | \
	ssh da4 ~/bin/hasObj1.perl commit | cut -d\; -f3 | uniq
done > git.debian.org.$DT.heads.get
