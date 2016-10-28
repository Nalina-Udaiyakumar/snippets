### script to plot a wordcloud off of a paragraph of text
library(wordcloud)

## choosing a color palette
pal <- brewer.pal(8, "Dark2")

## And, here's a passage from Wuthering Heights
para <- "‘This is nothing,’ cried she: 
    ‘I was only going to say that heaven did not seem to be my home; 
    and I broke my heart with weeping to come back to earth; 
    and the angels were so angry that they flung me out into 
    the middle of the heath on the top of Wuthering Heights; 
    where I woke sobbing for joy.  
    That will do to explain my secret, as well as the other.  
    I’ve no more business to marry Edgar Linton than I have to be in heaven; 
    and if the wicked man in there had not brought Heathcliff so low, 
    I shouldn’t have thought of it.  
    It would degrade me to marry Heathcliff now; 
    so he shall never know how I love him: and that, 
    not because he’s handsome, Nelly, but because he’s more myself than I am.  
    Whatever our souls are made of, his and mine are the same; 
    and Linton’s is as different as a moonbeam from lightning, or frost from fire.’"

## cleaning the passage
para <- str_replace_all(para,"[^[:alpha:][:space:]]","")  ## removing punctuation exccept space
words <- as.data.frame(unlist(strsplit(para, " ")))  ## splitting the sentences in to words
colnames(words) <- "Words"
words$Words <- as.character(words$Words)
words <- as.data.frame(words[-which(words$Words %in% c("\n","")),"Words"])  ## removing the empty strings and line breaks from vector
colnames(words) <- "Words"
tab <- as.data.frame(table(words))

## plotting the wordcloud
png("wordcloud2.png", width=1280,height=800)  ## opening a png file of the specified name and resolution in working directory
wordcloud(words = tab$words,freq = tab$Freq,scale=c(4,.2),min.freq = 2,random.color = F,colors = pal,rot.per=.15,random.order = F)
dev.off()
