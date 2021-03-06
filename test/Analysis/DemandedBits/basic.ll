; RUN: opt -S -demanded-bits -analyze < %s | FileCheck %s

; CHECK-LABEL: 'test_mul'
; CHECK-DAG: DemandedBits: 0xFF for   %1 = add nsw i32 %a, 5
; CHECK-DAG: DemandedBits: 0xFF for   %3 = trunc i32 %2 to i8
; CHECK-DAG: DemandedBits: 0xFF for   %2 = mul nsw i32 %1, %b
define i8 @test_mul(i32 %a, i32 %b) {
  %1 = add nsw i32 %a, 5
  %2 = mul nsw i32 %1, %b
  %3 = trunc i32 %2 to i8
  ret i8 %3
}
