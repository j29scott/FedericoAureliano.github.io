(declare-fun I0_2 () Int)
(declare-fun I0_6 () Int)
(declare-fun PCTEMP_LHS_1 () Int)
(declare-fun PCTEMP_LHS_2 () Int)
(declare-fun T0_2 () String)
(declare-fun T0_6 () String)
(declare-fun T1_2 () String)
(declare-fun T1_6 () String)
(declare-fun T2_2 () String)
(declare-fun T2_6 () String)
(declare-fun T3_2 () String)
(declare-fun T3_6 () String)
(declare-fun T4_2 () String)
(declare-fun T4_6 () String)
(declare-fun T5_2 () String)
(declare-fun T5_6 () String)
(declare-fun T_2 () Bool)
(declare-fun T_3 () Int)
(declare-fun T_5 () Bool)
(declare-fun T_6 () Bool)
(declare-fun T_SELECT_1 () Bool)
(declare-fun T_SELECT_2 () Bool)
(declare-fun var_0xINPUT_15383 () String)
(assert (= T_SELECT_1 (not (= PCTEMP_LHS_1 (- 1)))))
(assert (ite T_SELECT_1 (and (= PCTEMP_LHS_1 (+ I0_2 0))(= var_0xINPUT_15383 (str.++ T0_2 T1_2))(= I0_2 (str.len T4_2))(= 0 (str.len T0_2))(= T1_2 (str.++ T2_2 T3_2))(= T2_2 (str.++ T4_2 T5_2))(= T5_2 "GoogleAdServingTest=")(not (str.in.re T4_2 (re.++   (str.to.re "G" )  (re.++   (str.to.re "o" ) (re.++  (str.to.re "o" ) (re.++  (str.to.re "g" ) (re.++  (str.to.re "l" ) (re.++  (str.to.re "e" ) (re.++  (str.to.re "A" ) (re.++  (str.to.re "d" ) (re.++  (str.to.re "S" ) (re.++  (str.to.re "e" ) (re.++  (str.to.re "r" ) (re.++  (str.to.re "v" ) (re.++  (str.to.re "i" ) (re.++  (str.to.re "n" ) (re.++  (str.to.re "g" ) (re.++  (str.to.re "T" ) (re.++  (str.to.re "e" ) (re.++  (str.to.re "s" ) (re.++  (str.to.re "t" )  (str.to.re "=" )  ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ))) (and (= PCTEMP_LHS_1 (- 1))(= var_0xINPUT_15383 (str.++ T0_2 T1_2))(= 0 (str.len T0_2))(not (str.in.re T1_2 (re.++   (str.to.re "G" )  (re.++   (str.to.re "o" ) (re.++  (str.to.re "o" ) (re.++  (str.to.re "g" ) (re.++  (str.to.re "l" ) (re.++  (str.to.re "e" ) (re.++  (str.to.re "A" ) (re.++  (str.to.re "d" ) (re.++  (str.to.re "S" ) (re.++  (str.to.re "e" ) (re.++  (str.to.re "r" ) (re.++  (str.to.re "v" ) (re.++  (str.to.re "i" ) (re.++  (str.to.re "n" ) (re.++  (str.to.re "g" ) (re.++  (str.to.re "T" ) (re.++  (str.to.re "e" ) (re.++  (str.to.re "s" ) (re.++  (str.to.re "t" )  (str.to.re "=" )  ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) )))))
(assert (= T_2 (not (= PCTEMP_LHS_1 (- 1)))))
(assert T_2)
(assert (= T_3 (+ PCTEMP_LHS_1 20)))
(assert (= T_SELECT_2 (not (= PCTEMP_LHS_2 (- 1)))))
(assert (ite T_SELECT_2 (and (= PCTEMP_LHS_2 (+ I0_6 T_3))(= var_0xINPUT_15383 (str.++ T0_6 T1_6))(= I0_6 (str.len T4_6))(= T_3 (str.len T0_6))(= T1_6 (str.++ T2_6 T3_6))(= T2_6 (str.++ T4_6 T5_6))(= T5_6 ";")(not (str.in.re T4_6 (str.to.re ";" )))) (and (= PCTEMP_LHS_2 (- 1))(= var_0xINPUT_15383 (str.++ T0_6 T1_6))(= T_3 (str.len T0_6))(not (str.in.re T1_6 (str.to.re ";" ))))))
(assert (= T_5 (= PCTEMP_LHS_2 (- 1))))
(assert (= T_6 (not T_5)))
(assert T_6)
(check-sat)
