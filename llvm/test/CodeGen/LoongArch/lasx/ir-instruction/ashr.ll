; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 4
; RUN: llc --mtriple=loongarch64 --mattr=+lasx < %s | FileCheck %s

define void @ashr_v32i8(ptr %res, ptr %a0, ptr %a1) nounwind {
; CHECK-LABEL: ashr_v32i8:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvld $xr0, $a1, 0
; CHECK-NEXT:    xvld $xr1, $a2, 0
; CHECK-NEXT:    xvsra.b $xr0, $xr0, $xr1
; CHECK-NEXT:    xvst $xr0, $a0, 0
; CHECK-NEXT:    ret
entry:
  %v0 = load <32 x i8>, ptr %a0
  %v1 = load <32 x i8>, ptr %a1
  %v2 = ashr <32 x i8> %v0, %v1
  store <32 x i8> %v2, ptr %res
  ret void
}

define void @ashr_v16i16(ptr %res, ptr %a0, ptr %a1) nounwind {
; CHECK-LABEL: ashr_v16i16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvld $xr0, $a1, 0
; CHECK-NEXT:    xvld $xr1, $a2, 0
; CHECK-NEXT:    xvsra.h $xr0, $xr0, $xr1
; CHECK-NEXT:    xvst $xr0, $a0, 0
; CHECK-NEXT:    ret
entry:
  %v0 = load <16 x i16>, ptr %a0
  %v1 = load <16 x i16>, ptr %a1
  %v2 = ashr <16 x i16> %v0, %v1
  store <16 x i16> %v2, ptr %res
  ret void
}

define void @ashr_v8i32(ptr %res, ptr %a0, ptr %a1) nounwind {
; CHECK-LABEL: ashr_v8i32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvld $xr0, $a1, 0
; CHECK-NEXT:    xvld $xr1, $a2, 0
; CHECK-NEXT:    xvsra.w $xr0, $xr0, $xr1
; CHECK-NEXT:    xvst $xr0, $a0, 0
; CHECK-NEXT:    ret
entry:
  %v0 = load <8 x i32>, ptr %a0
  %v1 = load <8 x i32>, ptr %a1
  %v2 = ashr <8 x i32> %v0, %v1
  store <8 x i32> %v2, ptr %res
  ret void
}

define void @ashr_v4i64(ptr %res, ptr %a0, ptr %a1) nounwind {
; CHECK-LABEL: ashr_v4i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvld $xr0, $a1, 0
; CHECK-NEXT:    xvld $xr1, $a2, 0
; CHECK-NEXT:    xvsra.d $xr0, $xr0, $xr1
; CHECK-NEXT:    xvst $xr0, $a0, 0
; CHECK-NEXT:    ret
entry:
  %v0 = load <4 x i64>, ptr %a0
  %v1 = load <4 x i64>, ptr %a1
  %v2 = ashr <4 x i64> %v0, %v1
  store <4 x i64> %v2, ptr %res
  ret void
}

define void @ashr_v32i8_1(ptr %res, ptr %a0) nounwind {
; CHECK-LABEL: ashr_v32i8_1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvld $xr0, $a1, 0
; CHECK-NEXT:    xvsrai.b $xr0, $xr0, 1
; CHECK-NEXT:    xvst $xr0, $a0, 0
; CHECK-NEXT:    ret
entry:
  %v0 = load <32 x i8>, ptr %a0
  %v1 = ashr <32 x i8> %v0, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  store <32 x i8> %v1, ptr %res
  ret void
}

define void @ashr_v32i8_7(ptr %res, ptr %a0) nounwind {
; CHECK-LABEL: ashr_v32i8_7:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvld $xr0, $a1, 0
; CHECK-NEXT:    xvsrai.b $xr0, $xr0, 7
; CHECK-NEXT:    xvst $xr0, $a0, 0
; CHECK-NEXT:    ret
entry:
  %v0 = load <32 x i8>, ptr %a0
  %v1 = ashr <32 x i8> %v0, <i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7, i8 7>
  store <32 x i8> %v1, ptr %res
  ret void
}

define void @ashr_v16i16_1(ptr %res, ptr %a0) nounwind {
; CHECK-LABEL: ashr_v16i16_1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvld $xr0, $a1, 0
; CHECK-NEXT:    xvsrai.h $xr0, $xr0, 1
; CHECK-NEXT:    xvst $xr0, $a0, 0
; CHECK-NEXT:    ret
entry:
  %v0 = load <16 x i16>, ptr %a0
  %v1 = ashr <16 x i16> %v0, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  store <16 x i16> %v1, ptr %res
  ret void
}

define void @ashr_v16i16_15(ptr %res, ptr %a0) nounwind {
; CHECK-LABEL: ashr_v16i16_15:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvld $xr0, $a1, 0
; CHECK-NEXT:    xvsrai.h $xr0, $xr0, 15
; CHECK-NEXT:    xvst $xr0, $a0, 0
; CHECK-NEXT:    ret
entry:
  %v0 = load <16 x i16>, ptr %a0
  %v1 = ashr <16 x i16> %v0, <i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15, i16 15>
  store <16 x i16> %v1, ptr %res
  ret void
}

define void @ashr_v8i32_1(ptr %res, ptr %a0) nounwind {
; CHECK-LABEL: ashr_v8i32_1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvld $xr0, $a1, 0
; CHECK-NEXT:    xvsrai.w $xr0, $xr0, 1
; CHECK-NEXT:    xvst $xr0, $a0, 0
; CHECK-NEXT:    ret
entry:
  %v0 = load <8 x i32>, ptr %a0
  %v1 = ashr <8 x i32> %v0, <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  store <8 x i32> %v1, ptr %res
  ret void
}

define void @ashr_v8i32_31(ptr %res, ptr %a0) nounwind {
; CHECK-LABEL: ashr_v8i32_31:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvld $xr0, $a1, 0
; CHECK-NEXT:    xvsrai.w $xr0, $xr0, 31
; CHECK-NEXT:    xvst $xr0, $a0, 0
; CHECK-NEXT:    ret
entry:
  %v0 = load <8 x i32>, ptr %a0
  %v1 = ashr <8 x i32> %v0, <i32 31, i32 31, i32 31, i32 31, i32 31, i32 31, i32 31, i32 31>
  store <8 x i32> %v1, ptr %res
  ret void
}

define void @ashr_v4i64_1(ptr %res, ptr %a0) nounwind {
; CHECK-LABEL: ashr_v4i64_1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvld $xr0, $a1, 0
; CHECK-NEXT:    xvsrai.d $xr0, $xr0, 1
; CHECK-NEXT:    xvst $xr0, $a0, 0
; CHECK-NEXT:    ret
entry:
  %v0 = load <4 x i64>, ptr %a0
  %v1 = ashr <4 x i64> %v0, <i64 1, i64 1, i64 1, i64 1>
  store <4 x i64> %v1, ptr %res
  ret void
}

define void @ashr_v4i64_63(ptr %res, ptr %a0) nounwind {
; CHECK-LABEL: ashr_v4i64_63:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvld $xr0, $a1, 0
; CHECK-NEXT:    xvsrai.d $xr0, $xr0, 63
; CHECK-NEXT:    xvst $xr0, $a0, 0
; CHECK-NEXT:    ret
entry:
  %v0 = load <4 x i64>, ptr %a0
  %v1 = ashr <4 x i64> %v0, <i64 63, i64 63, i64 63, i64 63>
  store <4 x i64> %v1, ptr %res
  ret void
}
