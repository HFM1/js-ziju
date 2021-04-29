define void @printChar(i64 %$$c) {
  %sym5 = add i64 1, 0
  %sym7 = add i64 %$$c, 0
  %sym6 = alloca i64, align 4
  store i64 %sym7, i64* %sym6, align 4
  %sym8 = add i64 1, 0
  %sym9 = add i64 33554436, 0
  %sym3 = call i64 asm sideeffect "syscall", "=r,{rax},{rdi},{rsi},{rdx},~{dirflag},~{fpsr},~{flags}" (i64 %sym9, i64 %sym5, i64* %sym6, i64 %sym8)
  ret void
}

define void @printHelper(i64 %n) {
  %ifresult8 = alloca i64, align 4
  %sym9 = add i64 %n, 0
  %sym10 = add i64 9, 0
  %sym7 = icmp sgt i64 %sym9, %sym10
  br i1 %sym7, label %iftrue11, label %iffalse12
iftrue11:
  %sym15 = add i64 %n, 0
  %sym16 = add i64 10, 0
  %sym14 = udiv i64 %sym15, %sym16
  call void @printHelper(i64 %sym14)
  br label %ifend17
iffalse12:
  br label %ifend17
ifend17:
  %sym20 = add i64 48, 0
  %sym22 = add i64 %n, 0
  %sym23 = add i64 10, 0
  %sym21 = urem i64 %sym22, %sym23
  %sym19 = add i64 %sym20, %sym21
  call void @printChar(i64 %sym19)
  ret void
}

define void @print(i64 %n) {
  %sym9 = add i64 %n, 0
  call void @printHelper(i64 %sym9)
  %sym10 = add i64 10, 0
  call void @printChar(i64 %sym10)
  ret void
}

define i64 @tailFib(i64 %n1, i64 %n2, i64 %n) {
  %ifresult14 = alloca i64, align 4
  %sym15 = add i64 %n, 0
  %sym16 = add i64 0, 0
  %sym13 = icmp eq i64 %sym15, %sym16
  br i1 %sym13, label %iftrue17, label %iffalse18
iftrue17:
  %sym19 = add i64 %n1, 0
  ret i64 %sym19
  store i64 %sym19, i64* %ifresult14, align 4
  br label %ifend20
iffalse18:
  br label %ifend20
ifend20:
  %sym22 = add i64 %n2, 0
  %sym24 = add i64 %n1, 0
  %sym25 = add i64 %n2, 0
  %sym23 = add i64 %sym24, %sym25
  %sym27 = add i64 %n, 0
  %sym28 = add i64 1, 0
  %sym26 = sub i64 %sym27, %sym28
  %sym9 = call i64 @tailFib(i64 %sym22, i64 %sym23, i64 %sym26)
  ret i64 %sym9
}

define i64 @fibHelper(i64 %n) {
  %sym13 = add i64 0, 0
  %sym14 = add i64 1, 0
  %sym15 = add i64 %n, 0
  %sym11 = call i64 @tailFib(i64 %sym13, i64 %sym14, i64 %sym15)
  ret i64 %sym11
}

define void @main() {
  %sym15 = add i64 10, 0
  %sym14 = call i64 @fibHelper(i64 %sym15)
  call void @print(i64 %sym14)
  ret void
}

