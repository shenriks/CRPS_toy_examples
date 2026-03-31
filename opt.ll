; ModuleID = 'practice.c'
source_filename = "practice.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"malloc\00", align 1
@.str.1 = private unnamed_addr constant [26 x i8] c"Loop time: %f sec (a=%d)\0A\00", align 1
@.str.2 = private unnamed_addr constant [27 x i8] c"Sum time: %f sec (sum=%d)\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = tail call noalias dereferenceable_or_null(4000000) i8* @malloc(i64 noundef 4000000) #6
  %2 = bitcast i8* %1 to i32*
  %3 = icmp eq i8* %1, null
  br i1 %3, label %16, label %4

4:                                                ; preds = %0, %4
  %5 = phi i64 [ %14, %4 ], [ 0, %0 ]
  %6 = getelementptr inbounds i32, i32* %2, i64 %5
  %7 = bitcast i32* %6 to <8 x i32>*
  store <8 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>, <8 x i32>* %7, align 4, !tbaa !5
  %8 = getelementptr inbounds i32, i32* %6, i64 8
  %9 = bitcast i32* %8 to <8 x i32>*
  store <8 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>, <8 x i32>* %9, align 4, !tbaa !5
  %10 = getelementptr inbounds i32, i32* %6, i64 16
  %11 = bitcast i32* %10 to <8 x i32>*
  store <8 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>, <8 x i32>* %11, align 4, !tbaa !5
  %12 = getelementptr inbounds i32, i32* %6, i64 24
  %13 = bitcast i32* %12 to <8 x i32>*
  store <8 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>, <8 x i32>* %13, align 4, !tbaa !5
  %14 = add nuw i64 %5, 32
  %15 = icmp eq i64 %14, 1000000
  br i1 %15, label %17, label %4, !llvm.loop !9

16:                                               ; preds = %0
  tail call void @perror(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0)) #7
  br label %59

17:                                               ; preds = %4
  %18 = tail call i64 @clock() #6
  %19 = tail call i64 @clock() #6
  %20 = sub nsw i64 %19, %18
  %21 = sitofp i64 %20 to double
  %22 = fdiv double %21, 1.000000e+06
  %23 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([26 x i8], [26 x i8]* @.str.1, i64 0, i64 0), double noundef %22, i32 noundef 1000000)
  %24 = tail call i64 @clock() #6
  br label %25

25:                                               ; preds = %25, %17
  %26 = phi i64 [ 0, %17 ], [ %47, %25 ]
  %27 = phi <8 x i32> [ zeroinitializer, %17 ], [ %43, %25 ]
  %28 = phi <8 x i32> [ zeroinitializer, %17 ], [ %44, %25 ]
  %29 = phi <8 x i32> [ zeroinitializer, %17 ], [ %45, %25 ]
  %30 = phi <8 x i32> [ zeroinitializer, %17 ], [ %46, %25 ]
  %31 = getelementptr inbounds i32, i32* %2, i64 %26
  %32 = bitcast i32* %31 to <8 x i32>*
  %33 = load <8 x i32>, <8 x i32>* %32, align 4, !tbaa !5
  %34 = getelementptr inbounds i32, i32* %31, i64 8
  %35 = bitcast i32* %34 to <8 x i32>*
  %36 = load <8 x i32>, <8 x i32>* %35, align 4, !tbaa !5
  %37 = getelementptr inbounds i32, i32* %31, i64 16
  %38 = bitcast i32* %37 to <8 x i32>*
  %39 = load <8 x i32>, <8 x i32>* %38, align 4, !tbaa !5
  %40 = getelementptr inbounds i32, i32* %31, i64 24
  %41 = bitcast i32* %40 to <8 x i32>*
  %42 = load <8 x i32>, <8 x i32>* %41, align 4, !tbaa !5
  %43 = add <8 x i32> %33, %27
  %44 = add <8 x i32> %36, %28
  %45 = add <8 x i32> %39, %29
  %46 = add <8 x i32> %42, %30
  %47 = add nuw i64 %26, 32
  %48 = icmp eq i64 %47, 1000000
  br i1 %48, label %49, label %25, !llvm.loop !12

49:                                               ; preds = %25
  %50 = add <8 x i32> %44, %43
  %51 = add <8 x i32> %45, %50
  %52 = add <8 x i32> %46, %51
  %53 = call i32 @llvm.vector.reduce.add.v8i32(<8 x i32> %52)
  %54 = tail call i64 @clock() #6
  %55 = sub nsw i64 %54, %24
  %56 = sitofp i64 %55 to double
  %57 = fdiv double %56, 1.000000e+06
  %58 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i64 0, i64 0), double noundef %57, i32 noundef %53)
  tail call void @free(i8* noundef nonnull %1) #6
  br label %59

59:                                               ; preds = %49, %16
  %60 = phi i32 [ 0, %49 ], [ 1, %16 ]
  ret i32 %60
}

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare void @perror(i8* nocapture noundef readonly) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @clock() local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: inaccessiblemem_or_argmemonly mustprogress nounwind willreturn
declare void @free(i8* nocapture noundef) local_unnamed_addr #4

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v8i32(<8 x i32>) #5

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="goldmont" "target-features"="+64bit,+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves,-amx-bf16,-amx-int8,-amx-tile,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512fp16,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-cldemote,-clzero,-enqcmd,-fma4,-lwp,-mwaitx,-prefetchwt1,-rtm,-sgx,-sse4a,-tbm,-tsxldtrk,-uintr,-wbnoinvd,-xop" }
attributes #1 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="goldmont" "target-features"="+64bit,+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves,-amx-bf16,-amx-int8,-amx-tile,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512fp16,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-cldemote,-clzero,-enqcmd,-fma4,-lwp,-mwaitx,-prefetchwt1,-rtm,-sgx,-sse4a,-tbm,-tsxldtrk,-uintr,-wbnoinvd,-xop" }
attributes #2 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="goldmont" "target-features"="+64bit,+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves,-amx-bf16,-amx-int8,-amx-tile,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512fp16,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-cldemote,-clzero,-enqcmd,-fma4,-lwp,-mwaitx,-prefetchwt1,-rtm,-sgx,-sse4a,-tbm,-tsxldtrk,-uintr,-wbnoinvd,-xop" }
attributes #3 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="goldmont" "target-features"="+64bit,+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves,-amx-bf16,-amx-int8,-amx-tile,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512fp16,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-cldemote,-clzero,-enqcmd,-fma4,-lwp,-mwaitx,-prefetchwt1,-rtm,-sgx,-sse4a,-tbm,-tsxldtrk,-uintr,-wbnoinvd,-xop" }
attributes #4 = { inaccessiblemem_or_argmemonly mustprogress nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="goldmont" "target-features"="+64bit,+adx,+aes,+avx,+avx2,+avxvnni,+bmi,+bmi2,+clflushopt,+clwb,+cmov,+crc32,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+hreset,+invpcid,+kl,+lzcnt,+mmx,+movbe,+movdir64b,+movdiri,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+ptwrite,+rdpid,+rdrnd,+rdseed,+sahf,+serialize,+sha,+shstk,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+waitpkg,+widekl,+x87,+xsave,+xsavec,+xsaveopt,+xsaves,-amx-bf16,-amx-int8,-amx-tile,-avx512bf16,-avx512bitalg,-avx512bw,-avx512cd,-avx512dq,-avx512er,-avx512f,-avx512fp16,-avx512ifma,-avx512pf,-avx512vbmi,-avx512vbmi2,-avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-cldemote,-clzero,-enqcmd,-fma4,-lwp,-mwaitx,-prefetchwt1,-rtm,-sgx,-sse4a,-tbm,-tsxldtrk,-uintr,-wbnoinvd,-xop" }
attributes #5 = { nofree nosync nounwind readnone willreturn }
attributes #6 = { nounwind }
attributes #7 = { cold }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.isvectorized", i32 1}
!12 = distinct !{!12, !10, !11}
