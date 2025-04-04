# URL: https://www.hackerrank.com/challenges/nested-list/problem?isFullScreen=true

if __name__ == '__main__':
    nest = []
    scores = set()
    for _ in range(int(input())):
        name = input()
        score = float(input())
        nest.append([name, score])
        scores.add(score)
        
    scores.remove(min(scores))
    second_lowest_score = min(scores)
    
    names = []
    for item in nest:
        if item[1] == second_lowest_score:
            names.append(item[0])
            
    names.sort()
    
    print(*names, sep='\n')
        
    
    

