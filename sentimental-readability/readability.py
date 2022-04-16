# TODO
import cs50

def main():
    text=cs50.get_string("Text: ")

    letters=count_letters(text)
    words=count_words(text)
    sentences=count_sentences(text)

    L = letters/words*100
    S = sentences/words*100
    index=0.0588*L-0.296*S-15.8
    index=round(index)

    if index<1:
        print("Before Grade 1\n")
    elif index>15:
        print("Grade 16+")
    else:
        print(f"Grade {index}")

def count_letters(text):
    letters=0
    for ch in text:
        if(ord(ch.upper())>64 and ord(ch.upper())<91):
            letters+=1
    return letters
def count_words(text):
    words=0
    for ch in text:
        if(ch==' '):
            words+=1
    words+=1
    return words
def count_sentences(text):
    sentences=0
    for ch in text:
        if(ch=='.' or ch=='!' or ch=='?'):
            sentences+=1
    return sentences


if __name__ == "__main__":
    main()
