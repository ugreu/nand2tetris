- マルチプレクサ	
セレクタにより一つの出力を選択する。
- デマルチプレクサ	
セレクタにより多出力へ振り分ける。
- 多ビットバスから内部ピンへ出力する	
多ビットの一部を内部ピンへ出力することはできるが、多ビットの内部ピンから一つの入力ピンへ一部を入力することはできない。

```
// ok
Mux16(a=out2, b=false, sel=false, out[0..7]=out0to7, out[8..15]=out8to15);
Or8Way(in=out0to7, out=or1);
Or8Way(in=out8to15, out=or2);

// error
Mux16(a=out2, b=false, sel=false, out=isout);
Or8Way(in=isout[0..7], out=or1);
Or8Way(in=isout[8..15], out=or2);
```
