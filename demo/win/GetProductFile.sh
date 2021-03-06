#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�LlWWD_GetProductFile4ST_Win.sh �SMkA>g~�twK@L���,X5VPB�!�N���n�]"-�MIr�PL�GI� 5=�~[�LgҞ����͗�xHvf�y�y��}W� )�"n��G�Q̿n\om�����2��w>y}��쐵N���4f�E��P]!���c.S�&	�:.���O�f��C�.zv��I
23�9�X�_�/����r�p���hi��͹t�(c")7�y���`k��ؖG-��ܓ�i��+�w?�������$�N��}�N�>�K�n�� .�&u-����S�~Wa�U�*vj��2��MlZX�7��2�U�L��Ҥ�ko�rr��*���J-^ߓl��f�]�u �K�(���2�bA�:V���d(dP׃�t��^7+��̯-�V�ɋ`%M�X�!�����h�����r��V���a��qe�p�m�y��_���
�����^��Cь����zN�*+�����r2��c����.��	NAl_�`iZ�(Jj<��݉�JK4=tA!�R2�y47K|s����xe��j�zHO`���ױB`P�ܐ�0h�[PDw�iS��|ؐL��ժ�󷁪	��pwD�p�Ovpo�5���3q�P
���KQ�?�r72��s��E���D�  