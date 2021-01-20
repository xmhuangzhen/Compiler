#!python3

import os, time


"""
    Modify following configurations to adapt to your environment.
"""
# test_cases_dir = 'testcases/sema/class-package/'
test_cases_dir = 'testcases/sema/alltest/'
# test_cases_dir = 'testcases/codegen/'
# test_cases_dir = 'testcases/optim/'
compile_cmd = "bash build.bash"
execute_cmd = "bash semantic.bash"
excluded_test_cases = ["condition.mx", "test.mx", "bool-compare.mx"]
ravel_path = "ravel --enable-cache"
builtin_path = "./builtin/builtin.s"

halt_on_3_fails = False
calculate_score = False
test_codegen = False
# When test_codegen && use_llvm is true, the output should be a .ll file, and we will use llc to
# compile it into asm. You can test the correctness of your IR-gen with this.
use_llvm = False
llc_cmd = 'llc-10'


color_red = "\033[0;31m"
color_green = "\033[0;32m"
color_end = "\033[0m"


def collect_test_cases():
    test_cases = []
    for f in os.listdir(test_cases_dir):
        if os.path.splitext(f)[1] == '.mx':
            test_cases.append(f)
    for s in excluded_test_cases:
        if s in test_cases: test_cases.remove(s)
    test_cases.sort()
    return test_cases


def parse_test_case(test_case_path):
    with open(test_case_path, 'r') as f:
        lines = f.read().split('\n')
    src_start_idx = lines.index('*/', lines.index('/*')) + 1
    src_text = '\n'.join(lines[src_start_idx:])

    if lines.count("Verdict: Success"):
        verdict = True
    elif lines.count("Verdict: Fail"):
        verdict = False
    else:
        verdict = None

    return src_text, verdict


def main():
    if os.system(compile_cmd):
        print(color_red + "Fail when building your compiler..." + color_end)
        return
    test_cases = collect_test_cases()
    total = 0
    passed = 0
    continue_fail = 0
    score = []
    max_len = max(len(i) for i in test_cases)
    for t in test_cases:
        if halt_on_3_fails and (continue_fail > 2):
            exit(1)
        total += 1

        src_text, verdict = parse_test_case(test_cases_dir + t)

        with open('test.mx', 'w') as f:
            f.write(src_text)
        print(t + ':', end=' ')
        for i in range(len(t), max_len):
            print(end = ' ')

        if verdict == None:
            print(color_red +"Verdict not found in testcase!" + color_end)
            continue

        result = os.system('%s < ./test.mx > test.s' % execute_cmd)
        if (result == 0 and verdict == True) or (result != -1 and verdict == False):
            print(color_green + "Accepted" + color_end)
            passed += 1
            continue_fail = 0
        else:
            print(color_red + "Wrong Answer" + color_end)
            continue_fail += 1

    print()
    if passed == total:
        print(color_green + "total {}, passed {}, ratio {}".format(total, passed, passed / total) + color_end)
    else:
        print(color_red + "total {}, passed {}, ratio {}".format(total, passed, passed / total) + color_end)


if __name__ == '__main__':
    main()
