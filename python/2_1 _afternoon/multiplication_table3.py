for i in range(1, 10, 1):
    # print("-    %d 단    -" % i)
    for k in range(2, 10, 1):
        print("%d X %d = %2d" % (k, i, i * k), end="    ")
    print("")
