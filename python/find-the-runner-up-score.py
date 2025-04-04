# URL: https://www.hackerrank.com/challenges/find-second-maximum-number-in-a-list/problem?isFullScreen=true

if __name__ == '__main__':
    n = int(input())
    arr = map(int, input().split())
    
    array = list(arr)
    array.sort(reverse=True)
    
    first_max = array[0]
    second_max = 0
    
    for item in array:
        if item == first_max:
            continue
        else:
            second_max = item
            break
    
    print(second_max)
    
    
# More elegant solution
#arr_set = set(arr)
#arr_set.remove(max(arr_set))
#print(max(arr_set))           
