	.file	"cp.cc"
# GNU C++20 (Ubuntu 12.1.0-2ubuntu1~22.04) version 12.1.0 (x86_64-linux-gnu)
#	compiled by GNU C version 12.1.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=cascadelake -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -mno-sse4a -mno-fma4 -mno-xop -mfma -mavx512f -mbmi -mbmi2 -maes -mpclmul -mavx512vl -mavx512bw -mavx512dq -mavx512cd -mno-avx512er -mno-avx512pf -mno-avx512vbmi -mno-avx512ifma -mno-avx5124vnniw -mno-avx5124fmaps -mno-avx512vpopcntdq -mno-avx512vbmi2 -mno-gfni -mno-vpclmulqdq -mavx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mclwb -mno-clzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mno-movdir64b -mno-movdiri -mno-mwaitx -mno-pconfig -mno-pku -mno-prefetchwt1 -mprfchw -mno-ptwrite -mno-rdpid -mrdrnd -mrdseed -mno-rtm -mno-serialize -mno-sgx -mno-sha -mno-shstk -mno-tbm -mno-tsxldtrk -mno-vaes -mno-waitpkg -mno-wbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -mno-uintr -mno-hreset -mno-kl -mno-widekl -mno-avxvnni -mno-avx512fp16 --param=l1-cache-size=32 --param=l1-cache-line-size=64 --param=l2-cache-size=19712 -mtune=cascadelake -O3 -std=c++20 -fno-tree-vectorize -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"cannot create std::vector larger than max_size()"
	.text
	.p2align 4
	.globl	_Z9correlateiiPKfPf
	.type	_Z9correlateiiPKfPf, @function
_Z9correlateiiPKfPf:
.LFB1779:
	.cfi_startproc
	endbr64	
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
# /box/cp.cc:16:     std::vector<double> X(nx * ny);
	movl	%esi, %eax	# nx, tmp154
	imull	%edi, %eax	# ny, tmp154
# /box/cp.cc:12: {
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13	# tmp189, data
# /box/cp.cc:16:     std::vector<double> X(nx * ny);
	movslq	%eax, %rdx	# tmp154, _143
# /box/cp.cc:12: {
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
# /usr/include/c++/12/bits/stl_vector.h:1904: 	if (__n > _S_max_size(_Tp_alloc_type(__a)))
	movq	%rdx, %rax	# _143, tmp198
# /box/cp.cc:12: {
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp	#,
	.cfi_def_cfa_offset 128
# /usr/include/c++/12/bits/stl_vector.h:1904: 	if (__n > _S_max_size(_Tp_alloc_type(__a)))
	shrq	$60, %rax	#, tmp198
# /box/cp.cc:12: {
	movq	%rcx, 8(%rsp)	# tmp190, %sfp
# /usr/include/c++/12/bits/stl_vector.h:1904: 	if (__n > _S_max_size(_Tp_alloc_type(__a)))
	jne	.L49	#,
	movl	%edi, %ebp	# tmp187, ny
	movl	%esi, %ebx	# tmp188, nx
# /usr/include/c++/12/bits/stl_vector.h:378: 	return __n != 0 ? _Tr::allocate(_M_impl, __n) : pointer();
	testq	%rdx, %rdx	# _143
	je	.L50	#,
# /usr/include/c++/12/bits/new_allocator.h:137: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	leaq	0(,%rdx,8), %r14	#, _115
	movq	%r14, %rdi	# _115,
	movq	%rdx, 16(%rsp)	# _143, %sfp
	call	_Znwm@PLT	#
# /usr/include/c++/12/bits/stl_algobase.h:1114:       if (__n <= 0)
	movq	16(%rsp), %rdx	# %sfp, _143
# /usr/include/c++/12/bits/stl_construct.h:119:       ::new((void*)__p) _Tp(std::forward<_Args>(__args)...);
	movq	$0x000000000, (%rax)	#, *_116
# /usr/include/c++/12/bits/new_allocator.h:137: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	movq	%rax, %r12	# tmp191, _116
# /usr/include/c++/12/bits/stl_algobase.h:1114:       if (__n <= 0)
	cmpq	$1, %rdx	#, _143
	je	.L6	#,
# /usr/include/c++/12/bits/stl_uninitialized.h:662: 	      ++__first;
	leaq	8(%rax), %rdi	#, __first
# /usr/include/c++/12/bits/stl_vector.h:397: 	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
	leaq	(%rax,%r14), %rax	#, tmp159
# /usr/include/c++/12/bits/stl_algobase.h:921:       for (; __first != __last; ++__first)
	cmpq	%rax, %rdi	# tmp159, __first
	je	.L7	#,
# /usr/include/c++/12/bits/stl_algobase.h:922: 	*__first = __tmp;
	leaq	-8(%r14), %rdx	#, tmp160
	xorl	%esi, %esi	#
	call	memset@PLT	#
.L7:
# /box/cp.cc:17:     for (int y = 0; y < ny; y++)
	movq	%r14, %rdx	# _115, _143
	testl	%ebp, %ebp	# ny
	jle	.L8	#,
.L4:
# /box/cp.cc:28:         double std = 0;
	xorl	%esi, %esi	# ivtmp.109
# /box/cp.cc:17:     for (int y = 0; y < ny; y++)
	xorl	%ecx, %ecx	# y
	movl	%ebx, %eax	# nx, nx
	vxorps	%xmm3, %xmm3, %xmm3	# tmp193
	vcvtsi2sdl	%ebx, %xmm3, %xmm4	# nx, tmp193, tmp194
	movslq	%ebx, %r15	# nx, nx
	movl	%ecx, %ebx	# y, y
	movl	%ebp, %ecx	# ny, ny
	movl	%esi, %ebp	# ivtmp.109, ivtmp.109
	movq	%r12, %rsi	# _116, _116
	movl	%eax, %r12d	# nx, nx
	.p2align 4,,10
	.p2align 3
.L9:
# /box/cp.cc:21:         for (int x = 0; x < nx; x++)
	testl	%r12d, %r12d	# nx
	jle	.L17	#,
	movslq	%ebp, %r9	# ivtmp.109, _196
	leaq	0(%r13,%r9,4), %r14	#, _194
	leaq	(%r15,%r9), %rdi	#, tmp166
	leaq	0(%r13,%rdi,4), %r8	#, _187
	movq	%r14, %rax	# _194, ivtmp.99
# /box/cp.cc:23:             ave += (double)data[x + y * nx];
	movq	%r14, %rdi	# _194, ivtmp.104
# /box/cp.cc:20:         double ave = 0;
	vxorpd	%xmm0, %xmm0, %xmm0	# ave
	.p2align 4,,10
	.p2align 3
.L10:
# /box/cp.cc:23:             ave += (double)data[x + y * nx];
	vcvtss2sd	(%rdi), %xmm3, %xmm1	# MEM[(const float *)_193], tmp193, tmp195
# /box/cp.cc:21:         for (int x = 0; x < nx; x++)
	addq	$4, %rdi	#, ivtmp.104
# /box/cp.cc:23:             ave += (double)data[x + y * nx];
	vaddsd	%xmm1, %xmm0, %xmm0	# tmp168, ave, ave
# /box/cp.cc:21:         for (int x = 0; x < nx; x++)
	cmpq	%rdi, %r8	# ivtmp.104, _187
	jne	.L10	#,
# /box/cp.cc:25:         ave = ave / nx;
	vdivsd	%xmm4, %xmm0, %xmm1	# _272, ave, ave
# /box/cp.cc:28:         double std = 0;
	vxorpd	%xmm2, %xmm2, %xmm2	# std
	.p2align 4,,10
	.p2align 3
.L11:
# /box/cp.cc:31:             std += (double)pow((data[x + y * nx] - ave), 2);
	vcvtss2sd	(%rax), %xmm3, %xmm0	# MEM[(const float *)_208], tmp193, tmp196
# /box/cp.cc:31:             std += (double)pow((data[x + y * nx] - ave), 2);
	vsubsd	%xmm1, %xmm0, %xmm0	# ave, tmp169, _18
# /box/cp.cc:29:         for (int x = 0; x < nx; x++)
	addq	$4, %rax	#, ivtmp.99
# /box/cp.cc:31:             std += (double)pow((data[x + y * nx] - ave), 2);
	vfmadd231sd	%xmm0, %xmm0, %xmm2	# _18, _18, std
# /box/cp.cc:29:         for (int x = 0; x < nx; x++)
	cmpq	%rax, %r8	# ivtmp.99, _187
	jne	.L11	#,
	vxorpd	%xmm0, %xmm0, %xmm0	# tmp170
	vucomisd	%xmm2, %xmm0	# std, tmp170
	ja	.L42	#,
# /box/cp.cc:33:         std = sqrt(std);
	vsqrtsd	%xmm2, %xmm2, %xmm2	# std, std
.L14:
	leaq	(%rsi,%r9,8), %rdi	#, _216
# /box/cp.cc:28:         double std = 0;
	xorl	%eax, %eax	# ivtmp.91
	.p2align 4,,10
	.p2align 3
.L15:
# /box/cp.cc:38:             X[x + y * nx] = (double)(data[x + y * nx] - ave) / std;
	vcvtss2sd	(%r14,%rax,4), %xmm3, %xmm0	# MEM[(const float *)_194 + ivtmp.91_223 * 4], tmp193, tmp197
# /box/cp.cc:38:             X[x + y * nx] = (double)(data[x + y * nx] - ave) / std;
	vsubsd	%xmm1, %xmm0, %xmm0	# ave, tmp172, tmp173
# /box/cp.cc:38:             X[x + y * nx] = (double)(data[x + y * nx] - ave) / std;
	vdivsd	%xmm2, %xmm0, %xmm0	# std, tmp173, tmp174
# /box/cp.cc:38:             X[x + y * nx] = (double)(data[x + y * nx] - ave) / std;
	vmovsd	%xmm0, (%rdi,%rax,8)	# tmp174, MEM[(value_type &)_216 + ivtmp.91_223 * 8]
# /box/cp.cc:36:         for (int x = 0; x < nx; x++)
	incq	%rax	# ivtmp.91
	cmpq	%rax, %r15	# ivtmp.91, nx
	jne	.L15	#,
.L17:
# /box/cp.cc:17:     for (int y = 0; y < ny; y++)
	incl	%ebx	# y
# /box/cp.cc:17:     for (int y = 0; y < ny; y++)
	addl	%r12d, %ebp	# nx, ivtmp.109
	cmpl	%ebx, %ecx	# y, ny
	jg	.L9	#,
	movl	%r12d, %ebx	# nx, nx
	movl	%ecx, %ebp	# ny, ny
	movq	%rsi, %r12	# _116, _116
# /box/cp.cc:44:     for (int y = 0; y < ny; y++)
	testl	%ecx, %ecx	# ny
	jle	.L20	#,
	movq	8(%rsp), %r9	# %sfp, ivtmp.88
	movslq	%ecx, %r13	# ny, _233
	movq	%rsi, 8(%rsp)	# _116, %sfp
	leaq	0(,%r13,4), %r14	#, _232
	movq	%rdx, 16(%rsp)	# _143, %sfp
	xorl	%r11d, %r11d	# ivtmp.89
	xorl	%eax, %eax	# ivtmp.85
	movslq	%ebx, %r15	# nx, nx
	movq	%r14, %rdx	# _232, _232
	.p2align 4,,10
	.p2align 3
.L25:
	movq	8(%rsp), %rdi	# %sfp, _116
	movslq	%r11d, %r10	# ivtmp.89, _236
	leaq	(%r15,%r10), %rcx	#, tmp179
	leaq	(%rdi,%r10,8), %r14	#, ivtmp.71
	leaq	(%rdi,%rcx,8), %rsi	#, _247
# /box/cp.cc:49:             for (int k = 0; k < nx; k++)
	movl	%r11d, %r8d	# ivtmp.89, ivtmp.83
	movq	%rax, %rdi	# ivtmp.85, ivtmp.79
	.p2align 4,,10
	.p2align 3
.L26:
	movslq	%r8d, %r12	# ivtmp.83, _34
# /box/cp.cc:51:                 temp += X[k + y * nx] * X[k + x * nx];
	movq	%r14, %rcx	# ivtmp.71, ivtmp.71
# /box/cp.cc:48:             double temp = 0;
	vxorpd	%xmm0, %xmm0, %xmm0	# temp
# /box/cp.cc:51:                 temp += X[k + y * nx] * X[k + x * nx];
	subq	%r10, %r12	# _236, tmp176
# /box/cp.cc:49:             for (int k = 0; k < nx; k++)
	testl	%ebx, %ebx	# nx
	jle	.L51	#,
	.p2align 4,,10
	.p2align 3
.L21:
# /box/cp.cc:51:                 temp += X[k + y * nx] * X[k + x * nx];
	vmovsd	(%rcx), %xmm5	# MEM[(value_type &)_242], tmp288
	vfmadd231sd	(%rcx,%r12,8), %xmm5, %xmm0	# MEM[(value_type &)_242 + _254 * 8], tmp288, temp
# /box/cp.cc:49:             for (int k = 0; k < nx; k++)
	addq	$8, %rcx	#, ivtmp.71
	cmpq	%rsi, %rcx	# _247, ivtmp.71
	jne	.L21	#,
# /box/cp.cc:53:             result[y * ny + x] = float(temp);
	vcvtsd2ss	%xmm0, %xmm0, %xmm0	# temp, _269
.L24:
# /box/cp.cc:53:             result[y * ny + x] = float(temp);
	vmovss	%xmm0, (%r9,%rdi,4)	# _269, MEM[(float *)_267 + ivtmp.79_246 * 4]
# /box/cp.cc:46:         for (int x = y; x < ny; x++)
	incq	%rdi	# ivtmp.79
	addl	%ebx, %r8d	# nx, ivtmp.83
	cmpl	%edi, %ebp	# ivtmp.79, ny
	jg	.L26	#,
# /box/cp.cc:44:     for (int y = 0; y < ny; y++)
	incq	%rax	# ivtmp.85
	addq	%rdx, %r9	# _232, ivtmp.88
	addl	%ebx, %r11d	# nx, ivtmp.89
	cmpq	%r13, %rax	# _233, ivtmp.85
	jne	.L25	#,
	movq	8(%rsp), %r12	# %sfp, _116
	movq	16(%rsp), %rdx	# %sfp, _143
.L20:
# /usr/include/c++/12/bits/stl_vector.h:386: 	if (__p)
	testq	%r12, %r12	# _116
	jne	.L8	#,
.L46:
# /box/cp.cc:56: }
	addq	$72, %rsp	#,
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
.L51:
	.cfi_restore_state
# /box/cp.cc:49:             for (int k = 0; k < nx; k++)
	vxorps	%xmm0, %xmm0, %xmm0	# _269
	jmp	.L24	#
.L6:
# /usr/include/c++/12/bits/stl_vector.h:397: 	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
	movl	$8, %edx	#, _143
# /box/cp.cc:17:     for (int y = 0; y < ny; y++)
	testl	%ebp, %ebp	# ny
	jg	.L4	#,
.L8:
# /box/cp.cc:56: }
	addq	$72, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
# /usr/include/c++/12/bits/new_allocator.h:158: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	movq	%r12, %rdi	# _116,
# /box/cp.cc:56: }
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
# /usr/include/c++/12/bits/new_allocator.h:158: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	movq	%rdx, %rsi	# _143,
# /box/cp.cc:56: }
	popq	%r15	#
	.cfi_def_cfa_offset 8
# /usr/include/c++/12/bits/new_allocator.h:158: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	jmp	_ZdlPvm@PLT	#
.L50:
	.cfi_restore_state
# /usr/include/c++/12/bits/stl_vector.h:378: 	return __n != 0 ? _Tr::allocate(_M_impl, __n) : pointer();
	xorl	%r12d, %r12d	# _116
# /box/cp.cc:17:     for (int y = 0; y < ny; y++)
	testl	%edi, %edi	# ny
	jg	.L4	#,
	jmp	.L46	#
.L42:
# /box/cp.cc:33:         std = sqrt(std);
	vmovsd	%xmm2, %xmm2, %xmm0	# std,
	movl	%ecx, 60(%rsp)	# ny, %sfp
	movq	%rdx, 48(%rsp)	# _143, %sfp
	movq	%rsi, 40(%rsp)	# _116, %sfp
	movq	%r9, 24(%rsp)	# _196, %sfp
	vmovsd	%xmm4, 32(%rsp)	# _272, %sfp
	vmovsd	%xmm1, 16(%rsp)	# ave, %sfp
	call	sqrt@PLT	#
	vmovsd	%xmm0, %xmm0, %xmm2	# tmp192, std
	movl	60(%rsp), %ecx	# %sfp, ny
	movq	48(%rsp), %rdx	# %sfp, _143
	movq	40(%rsp), %rsi	# %sfp, _116
	vmovsd	32(%rsp), %xmm4	# %sfp, _272
	movq	24(%rsp), %r9	# %sfp, _196
	vmovsd	16(%rsp), %xmm1	# %sfp, ave
	vxorps	%xmm3, %xmm3, %xmm3	# tmp193
	jmp	.L14	#
.L49:
# /usr/include/c++/12/bits/stl_vector.h:1905: 	  __throw_length_error(
	leaq	.LC2(%rip), %rdi	#, tmp156
	call	_ZSt20__throw_length_errorPKc@PLT	#
	.cfi_endproc
.LFE1779:
	.size	_Z9correlateiiPKfPf, .-_Z9correlateiiPKfPf
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
