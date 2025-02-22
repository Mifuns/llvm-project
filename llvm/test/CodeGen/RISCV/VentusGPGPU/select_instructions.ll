; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mcpu=ventus-gpgpu -verify-machineinstrs < %s \
; RUN:   | FileCheck -check-prefix=VENTUS %s

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local i32 @slt(i32 noundef %a, i32 noundef %b) local_unnamed_addr  {
; VENTUS-LABEL: slt:
; VENTUS:       # %bb.0: # %entry
; VENTUS-NEXT:    vmslt.vv v0, v0, v1
; VENTUS-NEXT:    ret
entry:
  %cmp = icmp slt i32 %a, %b
  %cond = zext i1 %cmp to i32
  ret i32 %cond
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local i32 @slt_imm(i32 noundef %a) local_unnamed_addr  {
; VENTUS-LABEL: slt_imm:
; VENTUS:       # %bb.0: # %entry
; VENTUS-NEXT:    vmsle.vi v0, v0, 11
; VENTUS-NEXT:    ret
entry:
  %cmp = icmp slt i32 %a, 12
  %cond = zext i1 %cmp to i32
  ret i32 %cond
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local i32 @sltu(i32 noundef %a, i32 noundef %b) local_unnamed_addr  {
; VENTUS-LABEL: sltu:
; VENTUS:       # %bb.0: # %entry
; VENTUS-NEXT:    vmsltu.vv v0, v0, v1
; VENTUS-NEXT:    ret
entry:
  %cmp = icmp ult i32 %a, %b
  %cond = zext i1 %cmp to i32
  ret i32 %cond
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local i32 @sltu_imm(i32 noundef %a) local_unnamed_addr  {
; VENTUS-LABEL: sltu_imm:
; VENTUS:       # %bb.0: # %entry
; VENTUS-NEXT:    vmsleu.vi v0, v0, 11
; VENTUS-NEXT:    ret
entry:
  %cmp = icmp ult i32 %a, 12
  %cond = zext i1 %cmp to i32
  ret i32 %cond
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local i32 @sle(i32 noundef %a, i32 noundef %b) local_unnamed_addr  {
; VENTUS-LABEL: sle:
; VENTUS:       # %bb.0: # %entry
; VENTUS-NEXT:    vmsle.vv v0, v1, v0
; VENTUS-NEXT:    ret
entry:
  %cmp.not = icmp sle i32 %a, %b
  %cond = zext i1 %cmp.not to i32
  ret i32 %cond
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local i32 @sle_imm(i32 noundef %a) local_unnamed_addr  {
; VENTUS-LABEL: sle_imm:
; VENTUS:       # %bb.0: # %entry
; VENTUS-NEXT:    vmsle.vi v0, v0, 12
; VENTUS-NEXT:    ret
entry:
  %cmp = icmp slt i32 %a, 13
  %cond = zext i1 %cmp to i32
  ret i32 %cond
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local i32 @sleu(i32 noundef %a, i32 noundef %b) local_unnamed_addr  {
; VENTUS-LABEL: sleu:
; VENTUS:       # %bb.0: # %entry
; VENTUS-NEXT:    vmsleu.vv v0, v1, v0
; VENTUS-NEXT:    ret
entry:
  %cmp.not = icmp ule i32 %a, %b
  %cond = zext i1 %cmp.not to i32
  ret i32 %cond
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local i32 @sleu_imm(i32 noundef %a) local_unnamed_addr  {
; VENTUS-LABEL: sleu_imm:
; VENTUS:       # %bb.0: # %entry
; VENTUS-NEXT:    vmsleu.vi v0, v0, 12
; VENTUS-NEXT:    ret
entry:
  %cmp = icmp ult i32 %a, 13
  %cond = zext i1 %cmp to i32
  ret i32 %cond
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local i32 @slgt_imm(i32 noundef %a) local_unnamed_addr  {
; VENTUS-LABEL: slgt_imm:
; VENTUS:       # %bb.0: # %entry
; VENTUS-NEXT:    vmsgt.vi v0, v0, 12
; VENTUS-NEXT:    ret
entry:
  %cmp = icmp sgt i32 %a, 11
  %cond = zext i1 %cmp to i32
  ret i32 %cond
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local i32 @slgtu_imm(i32 noundef %a, i32 noundef %b) local_unnamed_addr  {
; VENTUS-LABEL: slgtu_imm:
; VENTUS:       # %bb.0: # %entry
; VENTUS-NEXT:    vmsgtu.vi v0, v0, 12
; VENTUS-NEXT:    ret
entry:
  %cmp = icmp ugt i32 %a, 11
  %cond = zext i1 %cmp to i32
  ret i32 %cond
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define dso_local i32 @slgtu_imm1(i32 noundef %a, i32 noundef %b) local_unnamed_addr  {
; VENTUS-LABEL: slgtu_imm1:
; VENTUS:       # %bb.0: # %entry
; VENTUS-NEXT:    vmsgt.vi v0, v0, 12
; VENTUS-NEXT:    ret
entry:
  %cmp = icmp sgt i32 %a, 11
  %cond = zext i1 %cmp to i32
  ret i32 %cond
}
