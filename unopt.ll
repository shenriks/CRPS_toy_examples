; ModuleID = 'practice.c'
source_filename = "practice.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"malloc\00", align 1
@.str.1 = private unnamed_addr constant [26 x i8] c"Loop time: %f sec (a=%d)\0A\00", align 1
@.str.2 = private unnamed_addr constant [27 x i8] c"Sum time: %f sec (sum=%d)\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 1000000, i32* %2, align 4
  store i32 0, i32* %3, align 4
  %11 = call noalias i8* @malloc(i64 noundef 4000000) #3
  %12 = bitcast i8* %11 to i32*
  store i32* %12, i32** %4, align 8
  %13 = load i32*, i32** %4, align 8
  %14 = icmp ne i32* %13, null
  br i1 %14, label %16, label %15

15:                                               ; preds = %0
  call void @perror(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0))
  store i32 1, i32* %1, align 4
  br label %74

16:                                               ; preds = %0
  store i32 0, i32* %5, align 4
  br label %17

17:                                               ; preds = %25, %16
  %18 = load i32, i32* %5, align 4
  %19 = icmp slt i32 %18, 1000000
  br i1 %19, label %20, label %28

20:                                               ; preds = %17
  %21 = load i32*, i32** %4, align 8
  %22 = load i32, i32* %5, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i32, i32* %21, i64 %23
  store i32 1, i32* %24, align 4
  br label %25

25:                                               ; preds = %20
  %26 = load i32, i32* %5, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %5, align 4
  br label %17, !llvm.loop !6

28:                                               ; preds = %17
  %29 = call i64 @clock() #3
  store i64 %29, i64* %6, align 8
  store i32 0, i32* %8, align 4
  br label %30

30:                                               ; preds = %36, %28
  %31 = load i32, i32* %8, align 4
  %32 = icmp slt i32 %31, 1000000
  br i1 %32, label %33, label %39

33:                                               ; preds = %30
  %34 = load i32, i32* %3, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %3, align 4
  br label %36

36:                                               ; preds = %33
  %37 = load i32, i32* %8, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %8, align 4
  br label %30, !llvm.loop !8

39:                                               ; preds = %30
  %40 = call i64 @clock() #3
  store i64 %40, i64* %7, align 8
  %41 = load i64, i64* %7, align 8
  %42 = load i64, i64* %6, align 8
  %43 = sub nsw i64 %41, %42
  %44 = sitofp i64 %43 to double
  %45 = fdiv double %44, 1.000000e+06
  %46 = load i32, i32* %3, align 4
  %47 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([26 x i8], [26 x i8]* @.str.1, i64 0, i64 0), double noundef %45, i32 noundef %46)
  store i32 0, i32* %9, align 4
  %48 = call i64 @clock() #3
  store i64 %48, i64* %6, align 8
  store i32 0, i32* %10, align 4
  br label %49

49:                                               ; preds = %60, %39
  %50 = load i32, i32* %10, align 4
  %51 = icmp slt i32 %50, 1000000
  br i1 %51, label %52, label %63

52:                                               ; preds = %49
  %53 = load i32*, i32** %4, align 8
  %54 = load i32, i32* %10, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32* %53, i64 %55
  %57 = load i32, i32* %56, align 4
  %58 = load i32, i32* %9, align 4
  %59 = add nsw i32 %58, %57
  store i32 %59, i32* %9, align 4
  br label %60

60:                                               ; preds = %52
  %61 = load i32, i32* %10, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %10, align 4
  br label %49, !llvm.loop !9

63:                                               ; preds = %49
  %64 = call i64 @clock() #3
  store i64 %64, i64* %7, align 8
  %65 = load i64, i64* %7, align 8
  %66 = load i64, i64* %6, align 8
  %67 = sub nsw i64 %65, %66
  %68 = sitofp i64 %67 to double
  %69 = fdiv double %68, 1.000000e+06
  %70 = load i32, i32* %9, align 4
  %71 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i64 0, i64 0), double noundef %69, i32 noundef %70)
  %72 = load i32*, i32** %4, align 8
  %73 = bitcast i32* %72 to i8*
  call void @free(i8* noundef %73) #3
  store i32 0, i32* %1, align 4
  br label %74

74:                                               ; preds = %63, %15
  %75 = load i32, i32* %1, align 4
  ret i32 %75
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #1

declare void @perror(i8* noundef) #2

; Function Attrs: nounwind
declare i64 @clock() #1

declare i32 @printf(i8* noundef, ...) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
