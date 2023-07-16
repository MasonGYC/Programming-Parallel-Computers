	.file	"cp.cc"
# GNU C++20 (Ubuntu 12.1.0-2ubuntu1~22.04) version 12.1.0 (x86_64-linux-gnu)
#	compiled by GNU C version 12.1.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=cascadelake -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -mno-sse4a -mno-fma4 -mno-xop -mfma -mavx512f -mbmi -mbmi2 -maes -mpclmul -mavx512vl -mavx512bw -mavx512dq -mavx512cd -mno-avx512er -mno-avx512pf -mno-avx512vbmi -mno-avx512ifma -mno-avx5124vnniw -mno-avx5124fmaps -mno-avx512vpopcntdq -mno-avx512vbmi2 -mno-gfni -mno-vpclmulqdq -mavx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mclwb -mno-clzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mno-movdir64b -mno-movdiri -mno-mwaitx -mno-pconfig -mno-pku -mno-prefetchwt1 -mprfchw -mno-ptwrite -mno-rdpid -mrdrnd -mrdseed -mno-rtm -mno-serialize -mno-sgx -mno-sha -mno-shstk -mno-tbm -mno-tsxldtrk -mno-vaes -mno-waitpkg -mno-wbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -mno-uintr -mno-hreset -mno-kl -mno-widekl -mno-avxvnni -mno-avx512fp16 --param=l1-cache-size=32 --param=l1-cache-line-size=64 --param=l2-cache-size=19712 -mtune=cascadelake -O3 -std=c++20 -fopenmp -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.p2align 4
	.type	_Z9correlateiiPKfPf._omp_fn.0, @function
_Z9correlateiiPKfPf._omp_fn.0:
.LFB4638:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%rdi, %rbx	# tmp170, .omp_data_i
	movl	32(%rdi), %r13d	# *.omp_data_i_7(D).nx, nx
	andq	$-32, %rsp	#,
	call	omp_get_num_threads@PLT	#
	movl	%eax, %r12d	# tmp171, _17
	call	omp_get_thread_num@PLT	#
# /box/cp.cc:78:         for (int x = 0; x < nx - nx % 4; x += 4)
	movl	%r13d, %edx	# nx, tmp130
	sarl	$31, %edx	#, tmp130
	shrl	$30, %edx	#, tmp131
	movl	%eax, %ecx	# tmp172, _18
	leal	0(%r13,%rdx), %eax	#, tmp132
	andl	$3, %eax	#, tmp133
	subl	%edx, %eax	# tmp131, tmp134
# /box/cp.cc:78:         for (int x = 0; x < nx - nx % 4; x += 4)
	movl	%r13d, %edx	# nx, tmp135
	subl	%eax, %edx	# tmp134, tmp135
	leal	6(%rdx), %eax	#, tmp139
	addl	$3, %edx	#, tmp136
	cmovns	%edx, %eax	# tmp139,, tmp136, tmp138
	sarl	$2, %eax	#, tmp140
	cltd
	idivl	%r12d	# _17
	cmpl	%edx, %ecx	# tt.17_2, _18
	jl	.L2	#,
.L5:
	imull	%eax, %ecx	# q.16_1, tmp143
	addl	%ecx, %edx	# tmp143, _25
	addl	%edx, %eax	# _25, _26
	cmpl	%eax, %edx	# _26, _25
	jge	.L7	#,
# /box/cp.cc:77: #pragma omp parallel for
	movl	40(%rbx), %ecx	# *.omp_data_i_7(D).y, y
# /box/cp.cc:81:             Xvec[y * nv + offset] = double4_t{(double)(data[x + y * nx] - ave) / std,
	movl	36(%rbx), %r8d	# *.omp_data_i_7(D).nv, _30
	sall	$2, %edx	#, x
	imull	%ecx, %r8d	# y, _30
# /box/cp.cc:81:             Xvec[y * nv + offset] = double4_t{(double)(data[x + y * nx] - ave) / std,
	imull	%r13d, %ecx	# nx, tmp146
	leal	0(,%rax,4), %esi	#, _28
	movslq	%edx, %rax	# x, x
	movslq	%ecx, %rcx	# tmp146, tmp147
	addq	%rax, %rcx	# x, tmp149
	movq	(%rbx), %rax	# *.omp_data_i_7(D).data, *.omp_data_i_7(D).data
	vbroadcastsd	24(%rbx), %ymm3	# *.omp_data_i_7(D).std, _208
	vbroadcastsd	16(%rbx), %ymm2	# *.omp_data_i_7(D).ave, _210
# /box/cp.cc:77: #pragma omp parallel for
	movq	8(%rbx), %rdi	# *.omp_data_i_7(D).Xvec, Xvec
	leaq	(%rax,%rcx,4), %rcx	#, ivtmp.93
	.p2align 4,,10
	.p2align 3
.L4:
# /box/cp.cc:81:             Xvec[y * nv + offset] = double4_t{(double)(data[x + y * nx] - ave) / std,
	vmovss	8(%rcx), %xmm1	# MEM[(const float *)_221 + 8B], MEM[(const float *)_221 + 8B]
	vmovss	(%rcx), %xmm0	# MEM[(const float *)_221], MEM[(const float *)_221]
	vinsertps	$0x10, 12(%rcx), %xmm1, %xmm1	# MEM[(const float *)_221 + 12B], MEM[(const float *)_221 + 8B], tmp161
	vinsertps	$0x10, 4(%rcx), %xmm0, %xmm0	# MEM[(const float *)_221 + 4B], MEM[(const float *)_221], tmp164
# /box/cp.cc:80:             int offset = x / 4;
	testl	%edx, %edx	# x
# /box/cp.cc:81:             Xvec[y * nv + offset] = double4_t{(double)(data[x + y * nx] - ave) / std,
	vmovlhps	%xmm1, %xmm0, %xmm0	# tmp161, tmp164, tmp160
	vcvtps2pd	%xmm0, %ymm0	# tmp160, vect__41.84
# /box/cp.cc:81:             Xvec[y * nv + offset] = double4_t{(double)(data[x + y * nx] - ave) / std,
	vsubpd	%ymm2, %ymm0, %ymm0	# _210, vect__41.84, vect__42.85
# /box/cp.cc:80:             int offset = x / 4;
	leal	3(%rdx), %eax	#, tmp154
	cmovns	%edx, %eax	# tmp154,, x, x
	addl	$4, %edx	#, x
# /box/cp.cc:81:             Xvec[y * nv + offset] = double4_t{(double)(data[x + y * nx] - ave) / std,
	vdivpd	%ymm3, %ymm0, %ymm0	# _208, vect__42.85, vect__43.86
# /box/cp.cc:80:             int offset = x / 4;
	sarl	$2, %eax	#, offset
# /box/cp.cc:81:             Xvec[y * nv + offset] = double4_t{(double)(data[x + y * nx] - ave) / std,
	addl	%r8d, %eax	# _30, tmp156
	cltq
# /box/cp.cc:81:             Xvec[y * nv + offset] = double4_t{(double)(data[x + y * nx] - ave) / std,
	salq	$5, %rax	#, tmp158
	addq	$16, %rcx	#, ivtmp.93
	vmovapd	%ymm0, (%rdi,%rax)	# vect__43.86, *_34
	cmpl	%edx, %esi	# x, _28
	jg	.L4	#,
	vzeroupper
.L7:
# /box/cp.cc:77: #pragma omp parallel for
	leaq	-24(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
	.p2align 4,,10
	.p2align 3
.L2:
	.cfi_restore_state
	incl	%eax	# q.16_1
# /box/cp.cc:78:         for (int x = 0; x < nx - nx % 4; x += 4)
	xorl	%edx, %edx	# tt.17_2
	jmp	.L5	#
	.cfi_endproc
.LFE4638:
	.size	_Z9correlateiiPKfPf._omp_fn.0, .-_Z9correlateiiPKfPf._omp_fn.0
	.p2align 4
	.type	_Z9correlateiiPKfPf._omp_fn.1, @function
_Z9correlateiiPKfPf._omp_fn.1:
.LFB4639:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	andq	$-32, %rsp	#,
	subq	$96, %rsp	#,
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
# /box/cp.cc:112:         for (int c = r; c < ny; c += s)
	movq	(%rdi), %rax	# *.omp_data_i_17(D).ny, *.omp_data_i_17(D).ny
# /box/cp.cc:111: #pragma omp parallel for
	movl	28(%rdi), %ebx	# *.omp_data_i_17(D).s, s
# /box/cp.cc:112:         for (int c = r; c < ny; c += s)
	movl	(%rax), %esi	# *_23, pretmp_168
# /box/cp.cc:111: #pragma omp parallel for
	movl	32(%rdi), %r15d	# *.omp_data_i_17(D).r, r
# /box/cp.cc:112:         for (int c = r; c < ny; c += s)
	movl	%esi, 88(%rsp)	# pretmp_168, %sfp
# /box/cp.cc:111: #pragma omp parallel for
	movq	%rdi, 72(%rsp)	# .omp_data_i, %sfp
	call	omp_get_num_threads@PLT	#
	movl	%eax, %r12d	# tmp228, _25
	call	omp_get_thread_num@PLT	#
	movl	88(%rsp), %esi	# %sfp, pretmp_168
	movl	%eax, %ecx	# tmp229, _26
	leal	-1(%rbx,%rsi), %eax	#, tmp175
	subl	%r15d, %eax	# r, tmp176
	cltd
	idivl	%ebx	# s
	cltd
	idivl	%r12d	# _25
	cmpl	%edx, %ecx	# tt.19_2, _26
	jl	.L11	#,
.L23:
	imull	%eax, %ecx	# q.18_1, tmp182
	addl	%ecx, %edx	# tmp182, _35
	addl	%edx, %eax	# _35, _36
	cmpl	%eax, %edx	# _36, _35
	jge	.L27	#,
	imull	%ebx, %eax	# s, tmp184
	movq	72(%rsp), %rdi	# %sfp, .omp_data_i
	imull	%ebx, %edx	# s, tmp183
	movl	24(%rdi), %r13d	# *.omp_data_i_17(D).nv, nv
	addl	%r15d, %eax	# r, _40
	movl	%eax, 32(%rsp)	# _40, %sfp
	movl	%ebx, %eax	# s, _180
	imull	%r13d, %eax	# nv, _180
	addl	%r15d, %edx	# r, c
	movl	%edx, %r11d	# c, ivtmp.138
	movl	%eax, 28(%rsp)	# _180, %sfp
	movl	%r15d, %eax	# r, ivtmp.126
	imull	%r13d, %eax	# nv, ivtmp.126
	imull	%r13d, %r11d	# nv, ivtmp.138
	movq	16(%rdi), %r14	# *.omp_data_i_17(D).Xvec, Xvec
	movq	8(%rdi), %rdi	# *.omp_data_i_17(D).result, result
	movl	%eax, 24(%rsp)	# ivtmp.126, %sfp
	leal	-1(%r13), %eax	#, tmp223
	movq	%rdi, 64(%rsp)	# result, %sfp
	andl	$-2, %eax	#, tmp224
# /box/cp.cc:114:             int j_up = std::min(r + s, ny);
	leal	(%r15,%rbx), %edi	#, _165
	movl	%r11d, %ecx	# ivtmp.138, ivtmp.138
	leal	3(%rax), %r12d	#, _200
	movl	%edi, %r8d	# _165, _165
	movl	%r15d, %r11d	# r, r
.L16:
	cmpl	%esi, %r8d	# pretmp_168, _165
	movl	%esi, %edi	# pretmp_168, _173
# /box/cp.cc:115:             int i_up = std::min(c + s, ny);
	leal	(%rdx,%rbx), %r9d	#, _46
	cmovle	%r8d, %edi	# _165,, _173
	cmpl	%esi, %r9d	# pretmp_168, _46
	cmovle	%r9d, %esi	# _46,, _175
# /box/cp.cc:117:             for (int j = r; j < j_up; j++)
	cmpl	%edi, %r11d	# _173, r
	jge	.L13	#,
	cmpl	%esi, %edx	# _175, c
	jge	.L13	#,
	movl	24(%rsp), %r15d	# %sfp, ivtmp.126
# /box/cp.cc:117:             for (int j = r; j < j_up; j++)
	movl	%edx, 40(%rsp)	# c, %sfp
	movl	%r11d, 20(%rsp)	# r, %sfp
	movl	%ebx, 16(%rsp)	# s, %sfp
	movl	%r9d, 12(%rsp)	# _46, %sfp
	movl	%r8d, 8(%rsp)	# _165, %sfp
	movl	%edi, 36(%rsp)	# _173, %sfp
	movl	%esi, 60(%rsp)	# _175, %sfp
	movl	%ecx, 44(%rsp)	# ivtmp.138, %sfp
	movl	%r12d, 56(%rsp)	# _200, %sfp
	movl	%r11d, %r10d	# r, j
	movl	%r15d, %r12d	# ivtmp.126, ivtmp.126
	.p2align 4,,10
	.p2align 3
.L18:
	movslq	%r12d, %r15	# ivtmp.126, ivtmp.126
	salq	$5, %r15	#, _106
	leaq	(%r14,%r15), %rax	#, ivtmp.108
	movq	%rax, 48(%rsp)	# ivtmp.108, %sfp
	movl	%r10d, 80(%rsp)	# j, %sfp
	movl	44(%rsp), %r8d	# %sfp, ivtmp.121
# /box/cp.cc:120:                 for (int i = c; i < i_up; i++)
	movl	40(%rsp), %ebx	# %sfp, i
	.p2align 4,,10
	.p2align 3
.L15:
# /box/cp.cc:126:                     for (int k = 0; k < nv; k += 2)
	testl	%r13d, %r13d	# nv
	jle	.L29	#,
	movslq	%r8d, %rdi	# ivtmp.121, ivtmp.121
# /box/cp.cc:122:                     double4_t temp = ZERO4;
	vxorpd	%xmm0, %xmm0, %xmm0	# temp
# /box/cp.cc:128:                         int i_idx = i * nv + k;
	movq	48(%rsp), %rdx	# %sfp, ivtmp.108
# /box/cp.cc:123:                     double4_t temp1 = ZERO4;
	movl	56(%rsp), %r9d	# %sfp, _200
	salq	$5, %rdi	#, _205
# /box/cp.cc:128:                         int i_idx = i * nv + k;
	movl	$1, %eax	#, ivtmp.110
# /box/cp.cc:123:                     double4_t temp1 = ZERO4;
	vmovapd	%ymm0, %ymm1	#, temp1
	.p2align 4,,10
	.p2align 3
.L20:
# /box/cp.cc:130:                         temp += Xvec[j_idx] * Xvec[i_idx];
	vmovapd	(%rdx), %ymm3	# MEM[(double4_t *)_212], tmp292
# /box/cp.cc:130:                         temp += Xvec[j_idx] * Xvec[i_idx];
	movq	%rdx, %rcx	# ivtmp.108, tmp197
	subq	%r15, %rcx	# _106, tmp197
# /box/cp.cc:130:                         temp += Xvec[j_idx] * Xvec[i_idx];
	vfmadd231pd	(%rcx,%rdi), %ymm3, %ymm0	# MEM[(double4_t *)_207 + _205 * 1], tmp292, temp
# /box/cp.cc:132:                         if (k + 1 < nv)
	cmpl	%eax, %r13d	# ivtmp.110, nv
	jle	.L22	#,
# /box/cp.cc:135:                             int j_idx = j * nv + k + 1;
	leal	(%rax,%r12), %esi	#, j_idx
# /box/cp.cc:136:                             temp1 += Xvec[j_idx] * Xvec[i_idx];
	movslq	%esi, %rsi	# j_idx, j_idx
# /box/cp.cc:136:                             temp1 += Xvec[j_idx] * Xvec[i_idx];
	salq	$5, %rsi	#, tmp212
# /box/cp.cc:134:                             int i_idx = i * nv + k + 1;
	leal	(%rax,%r8), %ecx	#, i_idx
# /box/cp.cc:136:                             temp1 += Xvec[j_idx] * Xvec[i_idx];
	vmovapd	(%r14,%rsi), %ymm4	# *_93, tmp294
# /box/cp.cc:136:                             temp1 += Xvec[j_idx] * Xvec[i_idx];
	movslq	%ecx, %rcx	# i_idx, i_idx
# /box/cp.cc:136:                             temp1 += Xvec[j_idx] * Xvec[i_idx];
	salq	$5, %rcx	#, tmp216
# /box/cp.cc:136:                             temp1 += Xvec[j_idx] * Xvec[i_idx];
	vfmadd231pd	(%r14,%rcx), %ymm4, %ymm1	# *_97, tmp294, temp1
.L22:
# /box/cp.cc:126:                     for (int k = 0; k < nv; k += 2)
	addl	$2, %eax	#, ivtmp.110
	addq	$64, %rdx	#, ivtmp.108
	cmpl	%eax, %r9d	# ivtmp.110, _200
	jne	.L20	#,
# /box/cp.cc:139:                     temp += temp1;
	vaddpd	%ymm0, %ymm1, %ymm1	# temp, temp1, _214
# /box/cp.cc:145:                         res += temp[m];
	vxorpd	%xmm5, %xmm5, %xmm5	# tmp293
	vaddsd	%xmm5, %xmm1, %xmm0	# tmp293, tmp198, tmp200
	vunpckhpd	%xmm1, %xmm1, %xmm2	# tmp199, tmp202
	vaddsd	%xmm2, %xmm0, %xmm0	# tmp202, tmp200, tmp204
	vextractf64x2	$1, %ymm1, %xmm2	#, _214, tmp205
	valignq	$3, %ymm1, %ymm1, %ymm1	#, _214, tmp208
	vaddsd	%xmm2, %xmm0, %xmm0	# tmp205, tmp204, tmp207
	vaddsd	%xmm1, %xmm0, %xmm1	# tmp208, tmp207, _230
	vzeroupper
.L21:
	movl	%r8d, 84(%rsp)	# ivtmp.121, %sfp
	vmovsd	%xmm1, 88(%rsp)	# _230, %sfp
# /box/cp.cc:147: #pragma omp critical
	call	GOMP_critical_start@PLT	#
# /box/cp.cc:148:                     result[j * ny + i] = float(res);
	movq	72(%rsp), %rax	# %sfp, .omp_data_i
	movl	80(%rsp), %edi	# %sfp, tmp188
	movq	(%rax), %rax	# *.omp_data_i_17(D).ny, *.omp_data_i_17(D).ny
# /box/cp.cc:148:                     result[j * ny + i] = float(res);
	vmovsd	88(%rsp), %xmm1	# %sfp, _230
# /box/cp.cc:148:                     result[j * ny + i] = float(res);
	imull	(%rax), %edi	# *_57, tmp188
# /box/cp.cc:148:                     result[j * ny + i] = float(res);
	vcvtsd2ss	%xmm1, %xmm1, %xmm1	# _230, tmp193
# /box/cp.cc:148:                     result[j * ny + i] = float(res);
	movl	%edi, %eax	# tmp188, tmp188
# /box/cp.cc:148:                     result[j * ny + i] = float(res);
	addl	%ebx, %eax	# i, tmp189
# /box/cp.cc:148:                     result[j * ny + i] = float(res);
	movq	64(%rsp), %rdi	# %sfp, result
# /box/cp.cc:148:                     result[j * ny + i] = float(res);
	cltq
# /box/cp.cc:148:                     result[j * ny + i] = float(res);
	vmovss	%xmm1, (%rdi,%rax,4)	# tmp193, *_63
# /box/cp.cc:147: #pragma omp critical
	call	GOMP_critical_end@PLT	#
# /box/cp.cc:120:                 for (int i = c; i < i_up; i++)
	movl	84(%rsp), %r8d	# %sfp, ivtmp.121
	movl	60(%rsp), %eax	# %sfp, _175
# /box/cp.cc:120:                 for (int i = c; i < i_up; i++)
	incl	%ebx	# i
# /box/cp.cc:120:                 for (int i = c; i < i_up; i++)
	addl	%r13d, %r8d	# nv, ivtmp.121
	cmpl	%eax, %ebx	# _175, i
	jne	.L15	#,
# /box/cp.cc:117:             for (int j = r; j < j_up; j++)
	movl	80(%rsp), %r10d	# %sfp, j
# /box/cp.cc:117:             for (int j = r; j < j_up; j++)
	movl	36(%rsp), %eax	# %sfp, _173
# /box/cp.cc:117:             for (int j = r; j < j_up; j++)
	incl	%r10d	# j
# /box/cp.cc:117:             for (int j = r; j < j_up; j++)
	addl	%r13d, %r12d	# nv, ivtmp.126
	cmpl	%eax, %r10d	# _173, j
	jne	.L18	#,
	movl	20(%rsp), %r11d	# %sfp, r
	movl	16(%rsp), %ebx	# %sfp, s
	movl	12(%rsp), %r9d	# %sfp, _46
	movl	8(%rsp), %r8d	# %sfp, _165
	movl	44(%rsp), %ecx	# %sfp, ivtmp.138
	movl	56(%rsp), %r12d	# %sfp, _200
.L13:
	movl	28(%rsp), %eax	# %sfp, _180
	addl	%eax, %ecx	# _180, ivtmp.138
	cmpl	%r9d, 32(%rsp)	# _46, %sfp
	jle	.L27	#,
# /usr/include/c++/12/bits/stl_algobase.h:235:       if (__b < __a)
	movq	72(%rsp), %rax	# %sfp, .omp_data_i
	movl	%r9d, %edx	# _46, c
	movq	(%rax), %rax	# *.omp_data_i_17(D).ny, *.omp_data_i_17(D).ny
	movl	(%rax), %esi	# MEM[(const int &)pretmp_166], pretmp_168
	jmp	.L16	#
	.p2align 4,,10
	.p2align 3
.L29:
# /box/cp.cc:126:                     for (int k = 0; k < nv; k += 2)
	vxorpd	%xmm1, %xmm1, %xmm1	# _230
	jmp	.L21	#
.L27:
# /box/cp.cc:111: #pragma omp parallel for
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
.L11:
	.cfi_restore_state
	incl	%eax	# q.18_1
# /box/cp.cc:112:         for (int c = r; c < ny; c += s)
	xorl	%edx, %edx	# tt.19_2
	jmp	.L23	#
	.cfi_endproc
.LFE4639:
	.size	_Z9correlateiiPKfPf._omp_fn.1, .-_Z9correlateiiPKfPf._omp_fn.1
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"cannot create std::vector larger than max_size()"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4
	.globl	_Z9correlateiiPKfPf
	.type	_Z9correlateiiPKfPf, @function
_Z9correlateiiPKfPf:
.LFB3795:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA3795
	endbr64	
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
# /box/cp.cc:43:     int nv = (nx + 3) / 4;
	leal	6(%rsi), %r14d	#, tmp198
# /box/cp.cc:39: {
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdx, %rbp	# tmp304, data
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$184, %rsp	#,
	.cfi_def_cfa_offset 240
# /box/cp.cc:39: {
	movl	%edi, 108(%rsp)	# ny, ny
	movq	%rcx, 96(%rsp)	# tmp305, %sfp
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp318
	movq	%rax, 168(%rsp)	# tmp318, D.85147
	xorl	%eax, %eax	# tmp318
# /box/cp.cc:43:     int nv = (nx + 3) / 4;
	movl	%esi, %eax	# nx, tmp196
	addl	$3, %eax	#, tmp196
	cmovns	%eax, %r14d	# tmp198,, tmp196, tmp197
# /box/cp.cc:44:     int pad_index = nx % 4;
	movl	%esi, %eax	# nx, tmp200
	sarl	$31, %eax	#, tmp200
	shrl	$30, %eax	#, tmp201
	leal	(%rsi,%rax), %edx	#, tmp202
	andl	$3, %edx	#, tmp203
	subl	%eax, %edx	# tmp201, tmp203
# /box/cp.cc:45:     std::vector<double> X(nx * ny);
	movl	%edi, %eax	# ny.0_2, tmp205
	imull	%esi, %eax	# nx, tmp205
# /box/cp.cc:43:     int nv = (nx + 3) / 4;
	sarl	$2, %r14d	#, tmp199
# /box/cp.cc:44:     int pad_index = nx % 4;
	movl	%edx, 48(%rsp)	# tmp203, %sfp
# /box/cp.cc:45:     std::vector<double> X(nx * ny);
	cltq
	movq	%rax, 88(%rsp)	# _4, %sfp
# /usr/include/c++/12/bits/stl_vector.h:1904: 	if (__n > _S_max_size(_Tp_alloc_type(__a)))
	shrq	$60, %rax	#, tmp319
	jne	.L86	#,
# /usr/include/c++/12/bits/stl_vector.h:378: 	return __n != 0 ? _Tr::allocate(_M_impl, __n) : pointer();
	movq	88(%rsp), %r15	# %sfp, _4
	movq	$0, 56(%rsp)	#, %sfp
	movl	%edi, %r13d	# ny, tmp302
	movl	%esi, %ebx	# tmp303, nx
	testq	%r15, %r15	# _4
	je	.L32	#,
# /usr/include/c++/12/bits/new_allocator.h:137: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	leaq	0(,%r15,8), %r12	#, _171
	movq	%r12, %rdi	# _171,
.LEHB0:
	call	_Znwm@PLT	#
	movq	%rax, 56(%rsp)	# iftmp.21_35, %sfp
# /usr/include/c++/12/bits/stl_construct.h:119:       ::new((void*)__p) _Tp(std::forward<_Args>(__args)...);
	movq	$0x000000000, (%rax)	#, *_172
# /usr/include/c++/12/bits/stl_algobase.h:1114:       if (__n <= 0)
	cmpq	$1, %r15	#, _4
	je	.L87	#,
# /usr/include/c++/12/bits/stl_uninitialized.h:662: 	      ++__first;
	leaq	8(%rax), %rdi	#, __first
# /usr/include/c++/12/bits/stl_vector.h:397: 	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
	addq	%r12, %rax	# _171, tmp210
# /box/cp.cc:46:     double4_t *Xvec = double4_alloc(ny * nv);
	movl	108(%rsp), %r13d	# ny, ny.0_2
# /usr/include/c++/12/bits/stl_algobase.h:921:       for (; __first != __last; ++__first)
	cmpq	%rax, %rdi	# tmp210, __first
	je	.L66	#,
# /usr/include/c++/12/bits/stl_algobase.h:922: 	*__first = __tmp;
	leaq	-8(%r12), %rdx	#, tmp211
	xorl	%esi, %esi	#
	call	memset@PLT	#
# /usr/include/c++/12/bits/stl_vector.h:397: 	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
	movq	%r12, 88(%rsp)	# _171, %sfp
.L32:
# /box/cp.cc:46:     double4_t *Xvec = double4_alloc(ny * nv);
	imull	%r14d, %r13d	# tmp199, tmp216
# /box/cp.cc:19:     if (posix_memalign(&tmp, sizeof(double4_t), sizeof(double4_t) * n))
	leaq	112(%rsp), %rax	#, tmp296
	movl	$32, %esi	#,
# /box/cp.cc:46:     double4_t *Xvec = double4_alloc(ny * nv);
	movslq	%r13d, %rdx	# tmp216, tmp217
# /box/cp.cc:19:     if (posix_memalign(&tmp, sizeof(double4_t), sizeof(double4_t) * n))
	salq	$5, %rdx	#, tmp218
	movq	%rax, %rdi	# tmp296,
# /box/cp.cc:18:     void *tmp = 0;
	movq	$0, 112(%rsp)	#, MEM[(void * *)_154]
# /box/cp.cc:19:     if (posix_memalign(&tmp, sizeof(double4_t), sizeof(double4_t) * n))
	movq	%rax, 8(%rsp)	# tmp296, %sfp
	call	posix_memalign@PLT	#
# /box/cp.cc:19:     if (posix_memalign(&tmp, sizeof(double4_t), sizeof(double4_t) * n))
	testl	%eax, %eax	# r
	jne	.L79	#,
# /box/cp.cc:48:     for (int y = 0; y < ny; y++)
	movl	108(%rsp), %edx	# ny,
# /box/cp.cc:23:     return (double4_t *)tmp;
	movq	112(%rsp), %r12	# MEM[(void * *)_154], _158
# /box/cp.cc:48:     for (int y = 0; y < ny; y++)
	testl	%edx, %edx	#
	jle	.L60	#,
# /box/cp.cc:86:         for (int x = nx - nx % 4; x < nx; x++)
	movl	48(%rsp), %edi	# %sfp, tmp204
	movl	%ebx, %ecx	# nx, x
	subl	%edi, %ecx	# tmp204, x
	movslq	%r14d, %rdx	# tmp199, nv
	salq	$5, %rdx	#, nv
	movl	%ecx, 20(%rsp)	# x, %sfp
	leal	-1(%r14), %ecx	#, row
	movq	%rdx, 64(%rsp)	# nv, %sfp
	movl	%ecx, 52(%rsp)	# row, %sfp
	movslq	%edi, %rdx	# tmp204, pad_index
	movslq	%ecx, %rcx	# row, row
	leaq	(%rdx,%rcx,4), %rdx	#, tmp230
	leaq	(%r12,%rdx,8), %rcx	#, ivtmp.164
	vxorps	%xmm2, %xmm2, %xmm2	# tmp311
# /box/cp.cc:99:                     Xvec[row][pad_idx] = (double)0;
	movl	$4, %edx	#, tmp233
	vcvtsi2sdl	%ebx, %xmm2, %xmm0	# nx, tmp311, tmp312
	subl	%edi, %edx	# tmp204, tmp234
	leaq	0(,%rdx,8), %rdi	#, _298
	movq	%rcx, 72(%rsp)	# ivtmp.164, %sfp
	movq	%rdi, 80(%rsp)	# _298, %sfp
	movl	%eax, 104(%rsp)	# r, %sfp
# /box/cp.cc:48:     for (int y = 0; y < ny; y++)
	xorl	%r11d, %r11d	# y
	movl	%r14d, %r8d	# tmp199, tmp199
# /box/cp.cc:99:                     Xvec[row][pad_idx] = (double)0;
	xorl	%r13d, %r13d	# ivtmp.197
	xorl	%r15d, %r15d	# ivtmp.196
	vmovsd	%xmm0, 40(%rsp)	# tmp312, %sfp
	movl	%r11d, %r14d	# y, y
	.p2align 4,,10
	.p2align 3
.L38:
# /box/cp.cc:53:         for (int x = 0; x < nx; x += 2)
	testl	%ebx, %ebx	# nx
	jle	.L88	#,
	movslq	%r15d, %rax	# ivtmp.196, ivtmp.196
# /box/cp.cc:52:         double ave2 = 0;
	vxorpd	%xmm3, %xmm3, %xmm3	# ave2
	leaq	0(%rbp,%rax,4), %rdx	#, _112
# /box/cp.cc:51:         double ave1 = 0;
	vmovsd	%xmm3, %xmm3, %xmm1	#, ave1
# /box/cp.cc:55:             ave1 += (double)data[x + y * nx];
	xorl	%eax, %eax	# ivtmp.187
# /box/cp.cc:58:                 ave2 += (double)data[x + 1 + y * nx];
	leal	1(%r15), %ecx	#, tmp299
	.p2align 4,,10
	.p2align 3
.L40:
# /box/cp.cc:56:             if (x + 1 < nx)
	leal	1(%rax), %esi	#, tmp238
# /box/cp.cc:55:             ave1 += (double)data[x + y * nx];
	vcvtss2sd	(%rdx,%rax,4), %xmm2, %xmm0	# MEM[(const float *)_112 + ivtmp.187_233 * 4], tmp311, tmp313
# /box/cp.cc:55:             ave1 += (double)data[x + y * nx];
	vaddsd	%xmm0, %xmm1, %xmm1	# tmp237, ave1, ave1
# /box/cp.cc:56:             if (x + 1 < nx)
	cmpl	%esi, %ebx	# tmp238, nx
	jle	.L39	#,
# /box/cp.cc:58:                 ave2 += (double)data[x + 1 + y * nx];
	leal	(%rcx,%rax), %esi	#, tmp240
	movslq	%esi, %rsi	# tmp240, tmp241
# /box/cp.cc:58:                 ave2 += (double)data[x + 1 + y * nx];
	vcvtss2sd	0(%rbp,%rsi,4), %xmm2, %xmm0	# *_20, tmp311, tmp314
# /box/cp.cc:58:                 ave2 += (double)data[x + 1 + y * nx];
	vaddsd	%xmm0, %xmm3, %xmm3	# tmp242, ave2, ave2
.L39:
# /box/cp.cc:53:         for (int x = 0; x < nx; x += 2)
	addq	$2, %rax	#, ivtmp.187
	cmpl	%eax, %ebx	# ivtmp.187, nx
	jg	.L40	#,
# /box/cp.cc:61:         double ave = (ave1 + ave2) / nx;
	vaddsd	%xmm1, %xmm3, %xmm1	# ave1, ave2, tmp244
# /box/cp.cc:65:         double std2 = 0;
	vxorpd	%xmm4, %xmm4, %xmm4	# std2
# /box/cp.cc:61:         double ave = (ave1 + ave2) / nx;
	xorl	%eax, %eax	# ivtmp.177
# /box/cp.cc:64:         double std1 = 0;
	vmovsd	%xmm4, %xmm4, %xmm3	#, std1
# /box/cp.cc:71:                 std2 += (double)pow((data[x + 1 + y * nx] - ave), 2);
	leal	1(%r15), %ecx	#, tmp298
# /box/cp.cc:61:         double ave = (ave1 + ave2) / nx;
	vdivsd	40(%rsp), %xmm1, %xmm1	# %sfp, tmp244, ave
	.p2align 4,,10
	.p2align 3
.L44:
# /box/cp.cc:68:             std1 += (double)pow((data[x + y * nx] - ave), 2);
	vcvtss2sd	(%rdx,%rax,4), %xmm2, %xmm0	# MEM[(const float *)_112 + ivtmp.177_281 * 4], tmp311, tmp315
# /box/cp.cc:68:             std1 += (double)pow((data[x + y * nx] - ave), 2);
	vsubsd	%xmm1, %xmm0, %xmm0	# ave, tmp245, _32
# /box/cp.cc:69:             if (x + 1 < nx)
	leal	1(%rax), %esi	#, tmp246
# /box/cp.cc:68:             std1 += (double)pow((data[x + y * nx] - ave), 2);
	vfmadd231sd	%xmm0, %xmm0, %xmm3	# _32, _32, std1
# /box/cp.cc:69:             if (x + 1 < nx)
	cmpl	%esi, %ebx	# tmp246, nx
	jle	.L43	#,
# /box/cp.cc:71:                 std2 += (double)pow((data[x + 1 + y * nx] - ave), 2);
	leal	(%rcx,%rax), %esi	#, tmp248
	movslq	%esi, %rsi	# tmp248, tmp249
# /box/cp.cc:71:                 std2 += (double)pow((data[x + 1 + y * nx] - ave), 2);
	vcvtss2sd	0(%rbp,%rsi,4), %xmm2, %xmm0	# *_39, tmp311, tmp316
# /box/cp.cc:71:                 std2 += (double)pow((data[x + 1 + y * nx] - ave), 2);
	vsubsd	%xmm1, %xmm0, %xmm0	# ave, tmp250, _42
# /box/cp.cc:71:                 std2 += (double)pow((data[x + 1 + y * nx] - ave), 2);
	vfmadd231sd	%xmm0, %xmm0, %xmm4	# _42, _42, std2
.L43:
# /box/cp.cc:66:         for (int x = 0; x < nx; x += 2)
	addq	$2, %rax	#, ivtmp.177
	cmpl	%eax, %ebx	# ivtmp.177, nx
	jg	.L44	#,
# /box/cp.cc:74:         double std = sqrt(std1 + std2);
	vaddsd	%xmm3, %xmm4, %xmm3	# std1, std2, _43
	vxorpd	%xmm6, %xmm6, %xmm6	# tmp423
	vucomisd	%xmm3, %xmm6	# _43, tmp423
	ja	.L81	#,
	vsqrtsd	%xmm3, %xmm3, %xmm3	# _43, std
.L47:
	movq	8(%rsp), %rsi	# %sfp,
# /box/cp.cc:77: #pragma omp parallel for
	vunpcklpd	%xmm3, %xmm1, %xmm0	# std, ave, tmp252
	xorl	%ecx, %ecx	#
	xorl	%edx, %edx	#
	leaq	_Z9correlateiiPKfPf._omp_fn.0(%rip), %rdi	#,
	movl	%r8d, 148(%rsp)	# tmp199, MEM[(struct .omp_data_s.9 *)_154].nv
	movl	%r8d, (%rsp)	# tmp199, %sfp
	vmovsd	%xmm3, 32(%rsp)	# std, %sfp
	vmovsd	%xmm1, 24(%rsp)	# ave, %sfp
	movl	%r14d, 152(%rsp)	# y, MEM[(struct .omp_data_s.9 *)_154].y
	movq	%r12, 120(%rsp)	# _158, MEM[(struct .omp_data_s.9 *)_154].Xvec
	movq	%rbp, 112(%rsp)	# data, MEM[(struct .omp_data_s.9 *)_154].data
	movl	%ebx, 144(%rsp)	# nx, MEM[(struct .omp_data_s.9 *)_154].nx
	vmovapd	%xmm0, 128(%rsp)	# tmp252, MEM <vector(2) double> [(double *)_154]
	call	GOMP_parallel@PLT	#
# /box/cp.cc:86:         for (int x = nx - nx % 4; x < nx; x++)
	movl	20(%rsp), %eax	# %sfp, x
	movl	(%rsp), %r8d	# %sfp, tmp199
	cmpl	%eax, %ebx	# x, nx
	vmovsd	24(%rsp), %xmm1	# %sfp, ave
	vmovsd	32(%rsp), %xmm3	# %sfp, std
	vxorps	%xmm2, %xmm2, %xmm2	# tmp311
	jle	.L52	#,
	movslq	%r15d, %rax	# ivtmp.196, ivtmp.196
	movslq	20(%rsp), %rdx	# %sfp, ivtmp.169
	leaq	0(%rbp,%rax,4), %rdi	#, _279
	.p2align 4,,10
	.p2align 3
.L51:
# /box/cp.cc:89:             Xvec[y * nv + offset][x % 4] = (double)(data[x + y * nx] - ave) / std;
	vcvtss2sd	(%rdi,%rdx,4), %xmm2, %xmm0	# MEM[(const float *)_279 + ivtmp.169_272 * 4], tmp311, tmp317
# /box/cp.cc:89:             Xvec[y * nv + offset][x % 4] = (double)(data[x + y * nx] - ave) / std;
	vsubsd	%xmm1, %xmm0, %xmm0	# ave, tmp272, tmp273
# /box/cp.cc:88:             int offset = x / 4;
	testl	%edx, %edx	# ivtmp.169
	leal	3(%rdx), %eax	#, tmp259
# /box/cp.cc:89:             Xvec[y * nv + offset][x % 4] = (double)(data[x + y * nx] - ave) / std;
	vdivsd	%xmm3, %xmm0, %xmm0	# std, tmp273, tmp274
# /box/cp.cc:88:             int offset = x / 4;
	cmovns	%edx, %eax	# tmp259,, ivtmp.169, x
# /box/cp.cc:89:             Xvec[y * nv + offset][x % 4] = (double)(data[x + y * nx] - ave) / std;
	movl	%edx, %esi	# ivtmp.169, tmp266
	sarl	$31, %esi	#, tmp266
	shrl	$30, %esi	#, tmp267
# /box/cp.cc:88:             int offset = x / 4;
	sarl	$2, %eax	#, offset
# /box/cp.cc:89:             Xvec[y * nv + offset][x % 4] = (double)(data[x + y * nx] - ave) / std;
	leal	(%rsi,%rdx), %ecx	#, tmp268
# /box/cp.cc:89:             Xvec[y * nv + offset][x % 4] = (double)(data[x + y * nx] - ave) / std;
	addl	%r13d, %eax	# ivtmp.197, tmp261
	cltq
# /box/cp.cc:89:             Xvec[y * nv + offset][x % 4] = (double)(data[x + y * nx] - ave) / std;
	andl	$3, %ecx	#, tmp269
# /box/cp.cc:89:             Xvec[y * nv + offset][x % 4] = (double)(data[x + y * nx] - ave) / std;
	salq	$5, %rax	#, tmp263
# /box/cp.cc:89:             Xvec[y * nv + offset][x % 4] = (double)(data[x + y * nx] - ave) / std;
	subl	%esi, %ecx	# tmp267, tmp270
# /box/cp.cc:89:             Xvec[y * nv + offset][x % 4] = (double)(data[x + y * nx] - ave) / std;
	addq	%r12, %rax	# _158, tmp264
	movslq	%ecx, %rcx	# tmp270, tmp271
# /box/cp.cc:86:         for (int x = nx - nx % 4; x < nx; x++)
	incq	%rdx	# ivtmp.169
# /box/cp.cc:89:             Xvec[y * nv + offset][x % 4] = (double)(data[x + y * nx] - ave) / std;
	vmovsd	%xmm0, (%rax,%rcx,8)	# tmp274, VIEW_CONVERT_EXPR<double[4]>(*_57)[_58]
# /box/cp.cc:86:         for (int x = nx - nx % 4; x < nx; x++)
	cmpl	%edx, %ebx	# ivtmp.169, nx
	jg	.L51	#,
.L52:
# /box/cp.cc:93:         if (pad_index > 0)
	movl	48(%rsp), %eax	# %sfp,
# /box/cp.cc:95:             for (int row = nv - 1; row < ny; row += nv)
	movl	108(%rsp), %r9d	# ny, pretmp_307
# /box/cp.cc:93:         if (pad_index > 0)
	testl	%eax, %eax	#
	jg	.L89	#,
.L50:
# /box/cp.cc:48:     for (int y = 0; y < ny; y++)
	incl	%r14d	# y
# /box/cp.cc:48:     for (int y = 0; y < ny; y++)
	addl	%ebx, %r15d	# nx, ivtmp.196
	addl	%r8d, %r13d	# tmp199, ivtmp.197
	cmpl	%r9d, %r14d	# pretmp_307, y
	jl	.L38	#,
# /box/cp.cc:109:     for (int r = 0; r < ny; r += s)
	movl	104(%rsp), %eax	# %sfp, r
	movl	%r8d, %r14d	# tmp199, tmp199
	testl	%r9d, %r9d	# pretmp_307
	jle	.L60	#,
	movq	96(%rsp), %r13	# %sfp, result
	leaq	108(%rsp), %rbp	#, tmp295
	leaq	_Z9correlateiiPKfPf._omp_fn.1(%rip), %rbx	#, tmp292
	movl	%eax, %r15d	# r, r
	.p2align 4,,10
	.p2align 3
.L61:
	movq	8(%rsp), %rsi	# %sfp,
# /box/cp.cc:111: #pragma omp parallel for
	movl	%r15d, 144(%rsp)	# r, MEM[(struct .omp_data_s.10 *)_154].r
	xorl	%ecx, %ecx	#
	xorl	%edx, %edx	#
	movq	%rbx, %rdi	# tmp292,
# /box/cp.cc:109:     for (int r = 0; r < ny; r += s)
	addl	$6, %r15d	#, r
# /box/cp.cc:111: #pragma omp parallel for
	movl	$6, 140(%rsp)	#, MEM[(struct .omp_data_s.10 *)_154].s
	movq	%r12, 128(%rsp)	# _158, MEM[(struct .omp_data_s.10 *)_154].Xvec
	movl	%r14d, 136(%rsp)	# tmp199, MEM[(struct .omp_data_s.10 *)_154].nv
	movq	%r13, 120(%rsp)	# result, MEM[(struct .omp_data_s.10 *)_154].result
	movq	%rbp, 112(%rsp)	# tmp295, MEM[(struct .omp_data_s.10 *)_154].ny
	call	GOMP_parallel@PLT	#
# /box/cp.cc:109:     for (int r = 0; r < ny; r += s)
	cmpl	%r15d, 108(%rsp)	# r, ny
	jg	.L61	#,
.L60:
# /box/cp.cc:153:     std::free(Xvec);
	movq	%r12, %rdi	# _158,
	call	free@PLT	#
# /usr/include/c++/12/bits/stl_vector.h:386: 	if (__p)
	cmpq	$0, 56(%rsp)	#, %sfp
	je	.L30	#,
# /usr/include/c++/12/bits/new_allocator.h:158: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	movq	88(%rsp), %rsi	# %sfp,
	movq	56(%rsp), %rdi	# %sfp,
	call	_ZdlPvm@PLT	#
.L30:
# /box/cp.cc:154: }
	movq	168(%rsp), %rax	# D.85147, tmp320
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp320
	jne	.L90	#,
	addq	$184, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L89:
	.cfi_restore_state
# /box/cp.cc:95:             for (int row = nv - 1; row < ny; row += nv)
	movl	52(%rsp), %eax	# %sfp, row
	movl	%eax, %r10d	# row, row
# /box/cp.cc:95:             for (int row = nv - 1; row < ny; row += nv)
	cmpl	%r9d, %eax	# pretmp_307, row
	jge	.L50	#,
	movq	80(%rsp), %rax	# %sfp, _298
# /box/cp.cc:99:                     Xvec[row][pad_idx] = (double)0;
	movl	%ebx, 32(%rsp)	# nx, %sfp
# /box/cp.cc:95:             for (int row = nv - 1; row < ny; row += nv)
	movq	72(%rsp), %rsi	# %sfp, ivtmp.164
# /box/cp.cc:99:                     Xvec[row][pad_idx] = (double)0;
	movq	64(%rsp), %rbx	# %sfp, _263
	movl	%r14d, 24(%rsp)	# y, %sfp
	movl	%eax, %r11d	# _298, _298
	xorl	%edi, %edi	# tmp277
	movq	%rax, %r14	# _298, _298
	.p2align 4,,10
	.p2align 3
.L56:
	leaq	8(%rsi), %rcx	#, tmp281
	andq	$-8, %rcx	#, tmp281
	movq	%rsi, %rdx	# ivtmp.164, ivtmp.164
	subq	%rcx, %rdx	# tmp281, ivtmp.164
	addl	%r14d, %edx	# _298, _298
	andl	$-8, %edx	#, _298
	movq	$0, (%rsi)	#,* ivtmp.164
	movq	$0, -8(%rsi,%r11)	#,
	cmpl	$8, %edx	#, _298
	jb	.L53	#,
	movq	%rsi, (%rsp)	# ivtmp.164, %sfp
	andl	$-8, %edx	#, tmp283
	xorl	%eax, %eax	# tmp282
.L54:
	movl	%eax, %esi	# tmp282, tmp284
	addl	$8, %eax	#, tmp282
	movq	%rdi, (%rcx,%rsi)	# tmp277,
	cmpl	%edx, %eax	# tmp283, tmp282
	jb	.L54	#,
	movq	(%rsp), %rsi	# %sfp, ivtmp.164
.L53:
# /box/cp.cc:95:             for (int row = nv - 1; row < ny; row += nv)
	addl	%r8d, %r10d	# tmp199, row
# /box/cp.cc:95:             for (int row = nv - 1; row < ny; row += nv)
	addq	%rbx, %rsi	# _263, ivtmp.164
	cmpl	%r9d, %r10d	# pretmp_307, row
	jl	.L56	#,
	movl	24(%rsp), %r14d	# %sfp, y
	movl	32(%rsp), %ebx	# %sfp, nx
	jmp	.L50	#
.L88:
# /box/cp.cc:61:         double ave = (ave1 + ave2) / nx;
	vxorpd	%xmm7, %xmm7, %xmm7	# tmp420
	vxorpd	%xmm3, %xmm3, %xmm3	# std
	vdivsd	40(%rsp), %xmm7, %xmm1	# %sfp, tmp420, ave
	jmp	.L47	#
.L87:
# /usr/include/c++/12/bits/stl_vector.h:397: 	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
	movq	$8, 88(%rsp)	#, %sfp
# /box/cp.cc:46:     double4_t *Xvec = double4_alloc(ny * nv);
	movl	108(%rsp), %r13d	# ny, ny.0_2
	jmp	.L32	#
.L66:
# /usr/include/c++/12/bits/stl_vector.h:397: 	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
	movq	%r12, 88(%rsp)	# _171, %sfp
	jmp	.L32	#
.L86:
# /usr/include/c++/12/bits/stl_vector.h:1905: 	  __throw_length_error(
	leaq	.LC1(%rip), %rdi	#, tmp207
	call	_ZSt20__throw_length_errorPKc@PLT	#
.LEHE0:
.L90:
# /box/cp.cc:154: }
	call	__stack_chk_fail@PLT	#
	.p2align 4,,10
	.p2align 3
.L81:
# /box/cp.cc:74:         double std = sqrt(std1 + std2);
	vmovsd	%xmm3, %xmm3, %xmm0	# _43,
	movl	%r8d, 24(%rsp)	# tmp199, %sfp
	vmovsd	%xmm1, (%rsp)	# ave, %sfp
	call	sqrt@PLT	#
	vmovsd	%xmm0, %xmm0, %xmm3	# tmp309, std
	movl	24(%rsp), %r8d	# %sfp, tmp199
	vmovsd	(%rsp), %xmm1	# %sfp, ave
	jmp	.L47	#
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA3795:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3795-.LLSDACSB3795
.LLSDACSB3795:
	.uleb128 .LEHB0-.LFB3795
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
.LLSDACSE3795:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC3795
	.type	_Z9correlateiiPKfPf.cold, @function
_Z9correlateiiPKfPf.cold:
.LFSB3795:
.L79:
	.cfi_def_cfa_offset 240
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
# /box/cp.cc:21:         throw std::bad_alloc();
	movl	$8, %edi	#,
	call	__cxa_allocate_exception@PLT	#
	movq	%rax, %rdi	# tmp308, tmp220
# /usr/include/c++/12/new:58:     bad_alloc() throw() { }
	leaq	16+_ZTVSt9bad_alloc(%rip), %rax	#, tmp409
	movq	%rax, (%rdi)	# tmp409, MEM[(struct bad_alloc *)_157].D.20645._vptr.exception
# /box/cp.cc:21:         throw std::bad_alloc();
	movq	_ZNSt9bad_allocD1Ev@GOTPCREL(%rip), %rdx	#,
	leaq	_ZTISt9bad_alloc(%rip), %rsi	#, tmp224
.LEHB1:
	call	__cxa_throw@PLT	#
.LEHE1:
.L67:
	endbr64	
# /usr/include/c++/12/bits/stl_vector.h:386: 	if (__p)
	cmpq	$0, 56(%rsp)	#, %sfp
	movq	%rax, %rbx	# tmp310, tmp289
	je	.L83	#,
# /usr/include/c++/12/bits/new_allocator.h:158: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	movq	88(%rsp), %rsi	# %sfp,
	movq	56(%rsp), %rdi	# %sfp,
	vzeroupper
	call	_ZdlPvm@PLT	#
.L63:
	movq	%rbx, %rdi	# tmp289,
.LEHB2:
	call	_Unwind_Resume@PLT	#
.LEHE2:
.L83:
	vzeroupper
	jmp	.L63	#
	.cfi_endproc
.LFE3795:
	.section	.gcc_except_table
.LLSDAC3795:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC3795-.LLSDACSBC3795
.LLSDACSBC3795:
	.uleb128 .LEHB1-.LCOLDB2
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L67-.LCOLDB2
	.uleb128 0
	.uleb128 .LEHB2-.LCOLDB2
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
.LLSDACSEC3795:
	.section	.text.unlikely
	.text
	.size	_Z9correlateiiPKfPf, .-_Z9correlateiiPKfPf
	.section	.text.unlikely
	.size	_Z9correlateiiPKfPf.cold, .-_Z9correlateiiPKfPf.cold
.LCOLDE2:
	.text
.LHOTE2:
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.ident	"GCC: (Ubuntu 12.1.0-2ubuntu1~22.04) 12.1.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
