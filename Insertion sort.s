.data
arr:    .word   2, 3, 7, 4, 1 # 삽입 정렬을 구현할 배열
.text
main: #제일 먼저 실행되는 곳
        la   s0, arr 
        addi t0, x0, 5     # 초기값 n
        addi t1, x0 ,0     # 초기값 i
        jal  sp, Loop1     # Loop1로 점프        
        ecall # 프로그램 퇴출
Loop1: # 첫 번째 루프
        addi t1, t1, 1     # i++
        slli t4, t1, 2     # data[i]의 주소 획득
        add  s1, s0, t4    # s1 = s0 + t4
        lw   t5, 0(s1)     # t5 = data[i]
        add  t3, t5, x0    # temp = data[i]
        addi t2, t1, -1    # j = i - 1
        blt  t1, t0, Loop2 # if( i < n ) 점프
        jr   ra #la s0, arr로 돌아간다.
Loop2: # 두 번째 루프
        slli t4, t2, 2     # data[j]의 주소 획득
        add  s1, s0, t4    # s1 = s0 + t4
        lw   t6, 0(s1)     # t6 = data[j]
        blt  t2, x0, Loop1 # if( j < 0 ) Loop2를 빠져나감
        bge  t3, t6, Loop1 # if( temp >= data[j]) Loop2를 빠져나감
        sw   t6, 4(s1)     # data[j+1] = data[j]
        sw   t3, 0(s1)     # data[j] = temp
        addi t2, t2, -1    # j--
        j    Loop2 #Loop2를 다시 시작

