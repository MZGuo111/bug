#RC4算法的Python实现##基本思路 RC4算法于1987年提出，和DES算法一样。是一种对称加密算法。RC4算法的特点是算法简单，执行速度快。并且密钥长度是可变的，可变范围为1-256字节(8-2048比特)，在现在技术支持的前提下，当密钥长度为128比特时，用暴力法搜索密钥已经不太可行，所以能够预见RC4的密钥范围任然能够在今后相当长的时间里抵御暴力搜索密钥的攻击。RC4算法的实现具体有一下几个部分：###产生S盒对S盒的混淆是确保RC4算法安全的前提。实现对S表的初始化，需要经过以下三个步骤：* 对S表进行线性填充* 用种子密钥填充R表* 用R表对S盒进行随机化处理在此程序中使用的是`init_key()`函数进行S盒的处理。###产生密钥流本部分需要同时用到明文和初始密钥，对其进行进一步处理产生可用的密钥流（256位），由函数`get_key()`实现。###加密利用得到的密钥流进行加密，由于加密采用的异或运算是对合运算，因此在实现时只使用了一个函数`RC4()`即同时完成了加密和解密过程。##使用方法该加密算法利用python实现，加密速度较慢。具体的输入格式可参照以下内容:  ```    	please input filepath: message.txt  	please input key: informationsecurity  	Encrypto successed! speed: 1.212120 MB/s    	Decrypto successed! speed: 1.212120 MB/s   ```  分别输入需要加密的文件和密钥，即可得到相应的加密和解密文件。由于在读取文件时使用了`suffix = filepath.split(".")[1]`获取文件的后缀名，所以最后得到的加密和解密文件与原文件是相同的后缀。  ##时间计算为了得到加密解密时间，调用了python中time模块的`time()`函数。由于文件较小，故采用了运行一定次数的累加，因此可能存在一定误差。最后得到的时间为1.2MB/s左右，速度较慢。