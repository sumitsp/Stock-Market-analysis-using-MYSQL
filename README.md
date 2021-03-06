# Stock-Market-analysis-using-MYSQL
**This is a project of Stock Market Analysis for predicting the _BUY_, _SELL_, or _HOLD_ conditions.**
### Introduction to the problem statement

Two of India's biggest stock exchanges BSE and NSE, collectively clear trades combining to greater than 40,000 crores every day. As you might already be aware, a lot of trading happens on the basis of technical and fundamental analysis.

One of the most basic technical analysis used by a lot of stock traders is the Moving Average Method. 
Consider the following price trend of a particular stock.

Week 1: 13,14,11,17,19

Week 2: 26,23,22,22,14

Week 3: 17,19,13,16,17

Moving average uses the past data to smoothen the price curve. For the purpose of this assignment, you will be using 20 day and 50 day moving averages.
Now that you know about the concept of moving average, you shall be wondering how to use it to determine whether to buy or sell a stock.
When the shorter-term moving average crosses above the longer-term moving average, it is a signal to _**BUY**_, as it indicates that the trend is shifting up. This is known as a Golden Cross.On the opposite when the shorter term moving average crosses below the longer term moving average, it is a signal to _**SELL**_, as it indicates the trend is shifting down. It is sometimes referred to as the Death Cross.
 
Please note that it is important that the moving averages cross each other in order to generate a signal. Merely being above or below is not sufficient to generate a signal.
When the signal is neither _**BUY**_ nor _**SELL**_, it is classified as _**HOLD**_. If you already own the stock, keep it and if you don't then don't buy it now.

