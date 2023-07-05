---
title: 测试测试吃
date: 2023-03-16 14:48:17
toc: true
tags:
- 后端
- 面试题
categories:
- 后端
---
#### 可以扫描下面二维码访问我的小程序来打开，随时随地通过微信访问。 
 
##### 这个是一些Java基础知识常见面试题，以及答案，我会逐个写出答案，实际上也是我学习的过程，一步一步来吧。 
 
#### 1. java中==和equals和hashCode的区别 
（1）==如果作用于基本数据类型的变量（byte,short,char,int,long,float,double,boolean ），则直接比较其存储的"值"是否相等；如果作用于引用类型的变量（String），则比较的是所指向的对象的地址（即是否指向同一个对象）。
（2）equal如果直接使用Object继承的方法则和==相同，但是如果equal重写的比较方法，自定义后就按照equal后的定义比较了 
（3）hashCode是将bean实体转换为哈希编码的方法 
 
#### 2. int与integer的区别 
 
 int 是java的基本类型，非null，初始值0，Integer是int的封装类型，可为null，以及一些方法，max，min等 

<!-- more -->

#### 3. 抽象类的意义

无法实例化，没有足够的信息来描述一个对象，实际是对某类对象的抽象出来的一些共有的定义以及方法。为公共的对象的非抽象方法提供了通用的定义，方便子类的使用。也可以定义抽象方法，不能有方法体，这种方法子类必须重写（这个实际和接口是一样的，如果子类也是抽象类可以不重写）
 
#### 4. 接口和抽象类的区别
一个类可以实现多个接口，但是一个类只能有一个抽象类的父类，接口所有方法都是抽象方法，必须由实现类实现这些抽象方法，而抽象类可以有非抽象方法，抽象类中的成员变量可以是各种类型的，而接口中的成员变量只能是 public static final 类型的， 接口中不能含有静态代码块以及静态方法(用 static 修饰的方法)，而抽象类是可以有静态代码块和静态方法。
 
#### 5. 能否创建一个包含可变对象的不可变对象?
```    
public class TestNotChanged {
    public static final TestDto testDto = new TestDto();
    public static void main(String[] args) {
        testDto.setCommParam(CommParam.builder().paramValue("1111").build());
        System.out.println(testDto.getCommParam());
        testDto.setCommParam(CommParam.builder().paramValue("2222").build());
        System.out.println(testDto.getCommParam());
    }
}
//输出
CommParam{paramKey='null', paramValue='1111'}
CommParam{paramKey='null', paramValue='2222'}

```
#### 6. 谈谈对java多态的理解
继承父类，重写父类的方法，Parent parent = new Child();这时在执行父类与子类都有的方法，实际会调用子类的方法。
#### 7. String、StringBuffer、StringBuilder区别
String 字符串常量、StringBuffer 字符串变量（线程安全，所有方法都是synchronized）、StringBuilder 字符串变量（非线程安全，效率高，没有synchronized）
#### 8. 泛型中extends和super的区别
extends表示泛型的上限（表示必须是该类型或者该类型的子类），super表示泛型的下限（表示必须是该类型或者该类型的父类）
#### 9. 进程和线程的区别
进程cpu执行任务的一段任务，而线程是这个任务在cpu上执行的具体操作。
#### 10. 序列化的方式
1>对象实现了序列化接口Serializable
2>实现接口Externalizable,实现writeExternal和readExternal方法
#### 11. string 转换成 integer的方式及原理
第一位可以是符号位（正负），正负值会在最后一步取正反。从左到右按位取值，例如325，第一位为3，则循环取，取出3，将3变为-3放到result中（个人认为这个是避免从正数超过int的最大值溢出），再取第二位2，这时需要先将result*进制（一般为10进制），变为-30，之后-30减去2得到result为-32，再取第三位5，先将result*进制，result变为-320，之后-320减去5得到-325，循环完毕，这个值是正数，所以需要取反，得到325.
#### 12. 静态属性和静态方法是否可以被继承？是否可以被重写？以及原因？
可以被子类继承使用，但是重写后不生效，因为static方法以及属性都是全局的，需要通过具体class名称来使用，即使方法名或者属性名相同，父类的静态方法只能是父类后边带方法，子类的静态方法只能是子类后边带方法。
```
public class Parent {
    public static String aaa = "aaa";
    public static String testMethod() {
        return aaa;
    }
}
public class Child extends Parent {
    public static String aaa = "aaaa";
    public static String testMethod() {
        return aaa;
    }
    public static void main(String[] args) {
        Parent a = new Child();
        System.out.println(a.aaa);
        Child b = new Child();
        System.out.println(b.aaa);
        System.out.println(Parent.testMethod());
        System.out.println(Child.testMethod());
    }
}
//输出
aaa
aaaa
aaa
aaaa
```
#### 13. 成员内部类、静态内部类、局部内部类和匿名内部类的理解，以及项目中的应用
成员内部类:定义在类内部的非静态类;
静态内部类:定义在类内部的静态类;
局部内部类:定义在方法中的类（只在某个方法中使用）;
匿名内部类:没有访问修饰符的直接通过new出来的内部类（例如事件监听的回调方法）
```
//匿名内部类
public void test() {
        Object obj = new Object() {
            @Override
            public String toString() {
                System.out.println(b);
                return String.valueOf(a);
            }
        };
        System.out.println(obj.toString());
    }

```
#### 14. 讲一下常见编码方式？
ASCII，ISO-8859-1、GBK/GB2312/UTF-16(双字节)/UTF-8（变长，开头是0表示ASCII，开始是11表示首字节，开始时10表示非首字节，前一个才是首字节）
如何格式化日期?
```
Date FormatDate = new SimpleDateFormat("YYYY-MM-DD").parse("2020-01-01")
LocalDateTime.now(ZoneId.of("Asia/Shanghai")).format(DateTimeFormatter.ofPattern("YYYY-MM-DD"))
```

#### 15. Java的异常体系



#### 16. 什么是异常链
不会覆盖原有的异常信息，将之前throw出来的异常加入到新的异常中
```
// 异常链写法1
Exception e2 = new Exception("第2个异常");
e2.initCause(e); // 异常链信息的传递
throw e2;
// 异常链写法2
// throw new Exception("第2个异常", e);
```

#### 17. throw和throws的区别
throw表示创建新的异常并扔出来，而throws表示方法定义的末尾，将内部可能throw出来的异常直接在方法级抛出

#### 18. 反射的原理，反射创建类实例的三种方式是什么。
```
//第一种，使用 Class.forName 静态方法。当你知道该类的全路径名时，你可以使用该方法获取 Class 类对象。
Class clz = Class.forName("com.aaa.Apple");
Apple apple = (Apple)clz.newInstance();

// 第二种，使用 .class 方法。
//这种方法只适合在编译前就知道操作的 Class。
Class clz = Apple.class;
Constructor constructor = clz.getConstructor();
Apple apple = (Apple)constructor.newInstance();
//第三种，使用类对象的 getClass() 方法。
String str = new String("Hello");
Class clz = str.getClass();
```

#### 19. java当中的四种引用
强引用：直接通过=赋值，内存不够也不会被回收，常见用法；
软引用：SoftReference<?>来表示，内存不足时会回收软引用，写完下面代码才理解，实际上这个是定义了一个引用，指向了里面的地址，实际上即使里面的变量设定为null了，引用还在，但是当内存不足时候回收掉，软引用就无法get到值了，变为null了，另外注意一定是new String出来，而不是直接写="123",这样写多少都是一个地址，无法回收，但是实际上这个没有回收成功，软引用的场景是缓存，图片缓存等；
弱引用：WeakReference<?>来表示，和软引用的写法类似，但是只要内存回收，弱引用就会被回收，下面的回收成功了，WeakHashMap，可以被回收的key值（HashMap的key值在删除前在不能被回收），而这种WeakHashMap的key在内存不足时可以被回收，使用前需要判断是否存在；
虚引用（PhantomReference） ，只能通过 ReferenceQueue 引用队列一起使用，创建时放入queue中，使用时通过queue的poll取出来，但是随时可能会被回收。当垃圾回收器准备回收一个对象时，如果发现它还有虚引用，就会在回收对象的内存之前，把这个虚引用加入到与之 关联的引用队列中。实际这个就是看何时发生回收的一个监控，目前没有其他的使用场景。
```
//弱引用
    public static void main(String[] args) throws Exception {
        String a = new String("1111");
        WeakReference<String> list =new WeakReference(a);
        a = null;
        while(true) {
            System.out.println(list.get());
            System.out.println("-----");
            System.gc();
            System.out.println(list.get());
            System.out.println("==========================================================================");
            if(list.get() == null){
                System.out.println("BREAKBREAKBREAKBREAK");
                break;
            }
        }
    }
//输出
[GC (Allocation Failure)  1023K->708K(5632K), 0.0011759 secs]
[GC (Allocation Failure)  1732K->1034K(5632K), 0.0010715 secs]
[GC (Allocation Failure)  2056K->1224K(5632K), 0.0008859 secs]
[GC (Allocation Failure)  2247K->1460K(5632K), 0.0009643 secs]
[GC (Allocation Failure)  2484K->1577K(5632K), 0.0009887 secs]
[GC (Allocation Failure)  2586K->1703K(5632K), 0.0015657 secs]
[GC (Allocation Failure)  2727K->1855K(5632K), 0.0017342 secs]
[GC (Allocation Failure)  2879K->2183K(5632K), 0.0010898 secs]
1111
-----
[GC (System.gc())  2990K->2264K(5632K), 0.0009776 secs]
[Full GC (System.gc())  2264K->1588K(5632K), 0.0179253 secs]
null
==========================================================================
BREAKBREAKBREAKBREAK
//虚引用
        String status = new String("123");
        ReferenceQueue<String> queue = new ReferenceQueue<>();
        PhantomReference<String> test = new PhantomReference<String>(status, queue);
        status = null;
        System.out.println(queue.poll());
        System.gc();
        Thread.sleep(2000L);
        System.out.println(queue.poll());
//输出
null
java.lang.ref.PhantomReference@58372a00

```
#### 20. 深拷贝和浅拷贝的区别是什么?
这里考点是对基本类型和引用类型的理解，基本类型浅拷贝和深拷贝没什么区别，都是copy出一份到新的内存地址，但是引用类型就不一样了，如果是浅拷贝，一些引用变量还是指向之前的地址，这就导致了修改了拷贝前的Bean的某个值，则另外一个Bean的该变量也会变化，因为内存地址是一样的，因此需要重写clone方法，将该变量copy一份到新内存地址，这样修改任何一个都不互相影响。
#### 21. 什么是编译器常量？使用它有什么风险？
这里考点是对编译器（期）常量和运行时常量的理解
```
    //编译期常量
    public static final String TEST = "TEST";
    //运行时常量
    public static final double TEST_DOUBLE = Math.random();
```
编译期常量实际上是在编译的时候初始化的变量，而运行时常量只有在运行时候才会初始化，编译时不知道是什么值。
在咱们大型项目中，会有增量打升级包的情况，此时如果A类引用了其B类的一个编译期常量（A类本次没有编译，B类的常量值修改后编译），那么上线后，会发现A类引用的编译期常量还是之前的值，会导致bug的产生，因此一定要注意一起编译。这个其实引入了JVM的知识点，A类引用了B累的编译期常量，实际会在编译时写死在A类中，也就是即使B类编译变化了也不影响A类的引用。

#### 22. 你对String对象的intern()熟悉么?

intern实际上是在常量池里寻找与其相等的String，并把地址返回过来，具体可以看下面的，s1和s4通过+实际上是不同的String，但是由于字符串实际相同，因此intern()也是相同的。
```
        String s1 = "abc";
        String s2 = "a";
        String s3 = "bc";
        String s4 = s2 + s3;
        System.out.println(s1 == s4);
        System.out.println(s1.intern() == s4.intern());
```
#### 23. a=a+b与a+=b有什么区别吗?

其实你注意下，他把类型去掉了？为什么呢？
这就是问题所在，隐去类型就是题目关心的，因为实际上如果类型一致，那么就不会有问题这两个操作是一致的，但是如果类型不一致，那么+=就会多出来一步类型转换。
```
	byte a=1;
	//a+=4;这个和下面实际上是相等的操作
    a = (byte)(a+4);
    //但是如果这么写编译期会报错，认为a+4转换为了int，但是实际上a是byte，两个类型不符合了
    a = a+4;
```
#### 24. 静态代理和动态代理的区别，什么场景使用？
这个有点长，我写了个帖子：
https://segmentfault.com/a/1190000040962971
#### 25. 如何将一个Java对象序列化到文件里？
可以查看我的另一个帖子：
https://segmentfault.com/a/1190000040941021
#### 26. 说说你对Java反射的理解
可以查看我的另一个帖子：
https://segmentfault.com/a/1190000040913240
#### 27. 说说你对Java注解的理解
可以查看我的另一个帖子：
https://segmentfault.com/a/1190000040957885
#### 28. 说说你对依赖注入的理解
在没有Spring或者在纯java的代码中，都是自己去new出来的对象，这样会导致很多代码中包含了大量的new，set各种代码
例如如果我需要数据库操作先创建Connection连接等一系列操作，很繁琐
出现了Spring以后，Spring容器把这些操作集合了，也就是咱们BeanA需要BeanB的时候，不需要再去new操作了，Spring容器帮助咱们把BeanB创建好了
BeanA想要使用BeanB直接拿来就可以用了(Spring容器帮助把BeanB注入到BeanA中了，BeanA依赖的BeanB就这样被注入进来了)，这种操作就是依赖注入了。
其实很多人还说有Ioc控制反转，个人理解就是以前需要BeanB就new出来就好了，现在容器把创建BeanB的过程拿走了，创建BeanB的过程被容器控制了。
DI依赖注入，实际就是BeanA依赖的BeanB被容器帮助下，容器把BeanB注入到了BeanA中。
#### 29. 说一下泛型原理，并举例说明
实际上java的泛型是个伪泛型，使用起来很方便，免去手写转型操作了。
具体原理时编译器在编译前会检测你针对List<String>这种定义的集合中存入内容时候，会去检测你传入的类型是否符合类型，如果不符合就给你提示类型传入的不对。
另外看源码：
```
    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        list.add("Sfsdf");
        String result = list.get(0);
        System.out.println(result);
    }
```
反编译后源码的，发现了什么，list取出来之后增加一个String转型，这个就是伪泛型了，实际上泛型编译成class时候，会帮助咱们进行转型操作，而不像C中的泛型，独立的类型，不需要转型操作：
```
  public static void main(String[] args)
  {
    List<String> list = new ArrayList();
    list.add("Sfsdf");
    String result = (String)list.get(0);
    System.out.println(result);
  }
```
更多的可以查看我的另一个帖子：
https://segmentfault.com/a/1190000040835933

#### 30. Java中String的了解
String类其实是通过char数组来保存字符串的
String类是final类，也即意味着String类不能被继承，并且它的成员方法都默认为final方法
String对象一旦被创建就是固定不变的了，对String对象的任何改变都不影响到原对象，相关的任何change操作都会生成新的对象
有两种创建方式直接通过""（这种方式直接使用常量池的常量）创建以及new String("")（这种方式，会将对象存储到堆中）的方式
String str3=str1+str2这个操作实际触发了StringBuilder的append方法以及toString方法。
但是String str4="abc"+"def";这种情况下，abc和def都在常量池内，因此拼接时候直接在常量池内拼接，生成的abcdef还在常量池中
String.intern()会直接从常量池里找到
String是不可变字符串对象，StringBuilder和StringBuffer是可变字符串对象（其内部的字符数组长度可变）
String中的对象是不可变的，也就可以理解为常量，显然线程安全。StringBuffer 与 StringBuilder中的方法和功能完全是等价的，只是StringBuffer 中的方法大都采用了synchronized关键字进行修饰，因此是线程安全的，而StringBuilder没有这个修饰，可以被认为是非线程安全的。

#### 31. String为什么要设计成不可变的？
如果设计成StringBuilder这种，作为key放在HashSet中，StringBuilder是可变的，如果分别放入了两个不同值的StringBuilder sb1和sb2，放入了后期修改了sb2的值和sb1的值相同，就会违反了HashSet的key值唯一性，另外在大量使用字符串，很多重复的字符串情况下，也是节省了很多存储空间，关键是它不可变所以也不会出现问题。
#### 32. Object类的equal和hashCode方法重写，为什么？
首先equal直接使用Object的话，是和==表示了相同的意思，因此如果有一些复杂的Bean需要特殊的比较时候，就需要重启equal了。比如修改了eqaul方法，某些情况下表示相同了，如果不重写hashCode时候，再存入HashSet或者HashMap的做为key的时候，可能不相同，这样就会表达出不同的意思。
另外java还有个规定：hashcode()不等，一定能推出equals()也不等；hashcode()相等，equals()可能相等，也可能不等。
#### 33. Java中实现多态的机制是什么？
Java实现多态有三个必要条件：继承、重写、向上转型。
继承：在多态中必须存在有继承关系的子类和父类。
重写：子类对父类中某些方法进行重新定义，在调用这些方法时就会调用子类的方法。
向上转型：在多态中需要将子类的引用赋给父类对象，只有这样该引用才能够具备技能调用父类的方法和子类的方法。
只有满足了上述三个条件，我们才能够在同一个继承结构中使用统一的逻辑实现代码处理不同的对象，从而达到执行不同的行为。
重载(overload)和重写(override)
如果一个子类继承了一个父类，子类中拥有和父类相同方法名称，返回值，参数类型的话，就是重写，会执行子类中的方法。
如果一个类中定义了多个同名方法，他们有不同的参数类型或者参数数量或者返回值类型，那就叫重载
=========以下内容2022.08.14新增==========
#### 34. 面向对象编程的特征有哪些？
（1）封装 (Encapsulation)，是指隐藏对象的属性和具体如何实现操作，控制成员属性的访问以及修改权限，只能通过专用的public方法来访问获取。具体如下。
```
private String test = "测试封装";
public String getTest(){
return this.name;
}
```
（2）继承 (Inheritance)，就是指子类继承父类，使得库子类也能具有父类相同的行为。
（3）多态 (Polymorphism)是指同一个行为具有多个不同的表现形式或形态，如一个类的方法在不同的参数情况有不同表现形式。

#### 35. i++和++i的区别
（1）i++是先使用当前i值使用，再对i进行自身+1操作。
（2）++i则相反，现对自身+1操作，再使用+1后的结果操作。

#### 36. JDK和JRE的区别
（1）JRE，Java Runtime Environment（java运行时环境）。即java程序的运行时环境，包含了java虚拟机，java基础类库。
（2）JDK，Java Development Kit（java开发工具包）。即java语言编写的程序所需的开发工具包。
（3）JDK包含了JRE，同时还包括java源码的编译器javac、监控工具jconsole、分析工具jvisualvm等。

#### 37. JAVA的关键字有哪些？
（1）48个关键字：abstract、assert、boolean、break、byte、case、catch、char、class、continue、default、do、double、else、enum、extends、final、finally、float、for、if、implements、import、int、interface、instanceof、long、native、new、package、private、protected、public、return、short、static、strictfp、super、switch、synchronized、this、throw、throws、transient、try、void、volatile、while。
（2）2个保留字（现在没用以后可能用到作为关键字）：goto、const。
（3）3个特殊直接变量：true、false、null。

#### 38. java中常量是什么？
常量就是不变的数据量, 在程序执行的过程中其值不可以发生改变。
如下所示就是常量的一种
```
private final static String NAME = "AAAABBBB";
```

#### 39. java中常量有哪些类型？
（1）整数常量
整型常量是整数类型的数据，有二进制、八进制、十进制和十六进制4种表示形式具体表示形式如下。
十进制表示方式：正常数字。 如 13、25等
二进制表示方式：以 0b(0B) 开头。 如0b1011 、0B1001
十六进制表示方式：以 0x(0X) 开头。 数字以0-9及A-F组成 如0x23A2、0xa、0x10
八进制表示方式：以 0 开头。 如01、07、0721
（2）浮点数常量，浮点数常量就是在数学中用到的小数，也叫小数类型，分为foat单精度浮点数和double双精度浮点数两种类型。如1.0、-3.15、3.168等
（3）字符常量，字符常量用于表示一个字符，一个字符常量要用一对英文半角格式的单引’’号引起来，它可以是英文字母、数字、标点符号以及由转义序列来表示的特殊字符。如 'a'，'A', '0', '家'。
（4）字符串常量，字符串常量用于表示一串连续的字符，一个字符串常量要用一对英文半角格式的双引号””引起来，如 "我爱Java"，"0123"，""，"null"。
（5）布尔型常量值，Java 的布尔型常量只有两个值，即 false（假）和 true（真）。
（6）null常量，null常量只有一个值null，表示对象的引用为空。

#### 40. public、private、protected以及默认的区别
（1）public，表示紧跟其后的成员可以被任何人引用
（2）private，表示紧跟其后的成员除了类型创建者和类型内部的方法，任何人都不可引用，否者程序编译报错
（3）protected，与private效果相当，差别仅在于继承的类可以访问protected成员
（4）默认访问权限（即定义属性时不加任何关键字修饰），默认访问权限通常被称为“包访问权限”，在这种权限下的成员变量可被同一个包中的其他类访问
```
package com.buxuesong;

public class TestBean {
    public int publicParam;
    String defaultParam;
    protected String protectedParam;
    private String privateParam;
}

package com.buxuesong;

public class ChildTestBean extends TestBean {
    public void setBean() {
        TestBean testBean = new TestBean();
        //public修饰成员可被任何人访问
        testBean.publicParam = 12;
        //同一个包中的类可访问默认权限成员
        testBean.defaultParam = "Bob";
        //继承的类可访问protected成员
        testBean.protectedParam = "UK";
        //ERROR 继承的类无法访问private成员
        testBean.privateParam = "man";
    }
}

package com.buxuesong.test;

import com.buxuesong.TestBean;

public class DifferentPackageBean {
    public void setBean() {
        TestBean testBean = new TestBean();
        //public修饰成员可被任何人访问
        testBean.publicParam = 12;
        //ERROR 包访问权限成员无法被其他包中的类访问
        testBean.defaultParam = "Bob";
        //ERROR protected成员无法被其他包中的类访问
        testBean.protectedParam = "UK";
        //ERROR private成员只能被类型创建者及类型内部方法访问
        testBean.privateParam = "man";
    }
}
```

#### 41. this和super有什么区别？
（1）this是自身的一个对象，代表对象本身，指向对象本身的一个指针。
（2）super可以理解为是指向自己超（父）类对象的一个指针，而这个超类指的是离自己最近的一个父类。
（3）属性的区别，this访问本类中的属性，如果本类没有此属性则从父类中继续查找。super访问父类中的属性。
（4）方法的区别，this访问本类中的方法，如果本类没有此方法则从父类中继续查找。super访问父类中的方法。
（5）构造的区别，this调用本类构造，必须放在构造方法的首行。super调用父类构造，必须放在子类构造方法首行。

#### 42. &和&&的区别是什么？
（1）java 中 && 和 & 都是表示与的逻辑运算符，都表示逻辑运输符 and，当两边的表达式都为 true 的时候，整个运算结果才为 true，否则为 false。
（2）& 叫做按位与，& 直接操作整数基本类型，而 && 不行。按位与运算符 “&” 是双目运算符。其功能是参与运算的两数各对应的二进位相与。只有对应的两个二进位都为 1 时，结果位才为 1。参与运算的两个数均以补码出现。例如， 0x31 & 0x0f 的结果为 0x01
（3）&& 叫做短路与，&& 有短路效应，即：当第一个布尔运算为 false，第二个布尔运算不执行。而 & 运算符没有。例如，对于 if (str != null && !str.equals (“”)) 表达式，当 str 为 null 时，后面的表达式不会执行，所以不会出现 NullPointerException。如果将 && 改为 &，则会抛出 NullPointerException 异常。 If (x==33 & ++y>0) y 会增长， If (x==33 && ++y>0) 不会增长

#### 43. ||和|的区别是什么？
（1）||和|都是表示“或”，区别是||只要满足第一个条件，后面的条件就不再判断（实际也不执行），而|要对所有的条件进行判断。
（2）“||”: 如果左边计算后的操作数为true,右边则不再执行，返回true；
（3）“|”：前后两个操作数都会进行计算。也就是说：“|”不存在短路。

#### 44. while和do while有什么区别？
（1）while，在while中的条件只要满足为true，则一直进行循环。
（2）do while，无论如何一定先执行一次do，具体可以看如下代码
```
public static void main(String[] args) {
    boolean flag = false;
    int i = 0;
    while(flag){
        i++;
    }
    System.out.println("while循环后结果："+i);
    do{
        i++;
    } while (flag);
    System.out.println("do while循环后结果："+i);
}
//输出
while循环后结果：0
do while循环后结果：1
```

#### 45. 如何跳出多重循环？
（1）普通的跳出循环通常使用break，但是break只能跳出当前循环，如果外层仍然有循环则无法跳出
（2）如果需要跳出多重循环则可以在指定的某一层循环设定为名字，则在break后边增加制定的名字，即可直接跳出具体某一层的循环，具体代码如下：
```
public static void main(String[] args) {
    // 为外层循环设定一个名字
    outer:
    for (int i = 0; i < 5; i++) {
        // 内层循环
        inner:
        for (int j = 0; j < 3; j++) {
            System.out.println("i的值为:" + i + " j的值为:" + j);

            if (j == 1) {
            // 跳出outer标签所标识的循环。
                //break inner;
                break outer;
            }
        }
    }
}
//输出
i的值为:0 j的值为:0
i的值为:0 j的值为:1
//但是如果使用break inner则只能跳出内层循环，外层循环仍然执行，具体输出如下
i的值为:0 j的值为:0
i的值为:0 j的值为:1
i的值为:1 j的值为:0
i的值为:1 j的值为:1
i的值为:2 j的值为:0
i的值为:2 j的值为:1
i的值为:3 j的值为:0
i的值为:3 j的值为:1
i的值为:4 j的值为:0
i的值为:4 j的值为:1

```

#### 46. int 和 Integer 有哪些区别？
（1）int和Integer的区别
Integer是int的包装类；int是基本数据类型,长度为32位（4）字节。
Integer是Java提供的封装类，在java.lang.Integer包里面。
Integer变量必须实例化后才能使用；int变量不需要。
Integer实际是对象的引用，当new一个Integer时，实际上是生成一个指针指向此对象；而int则是直接存储数据值。
Integer的默认值是null；int的默认值是0

（2）关于Integer和int的深入比较
由于Integer变量实际上是对一个Integer对象的引用，所以两个通过new生成的Integer变量永远是不相等的（因为new生成的是两个对象，其内存地址不同）。
```
Integer i = new Integer(100);
integer j = new Integer(100);
System.out.println(i==j);
//输出
false
```
Integer变量和int变量比较时，只要两个变量的值是向等的，则结果为true（因为包装类Integer和基本数据类型int比较时，Java会自动拆包装为int，然后进行比较，实际上就变为两个int变量的比较）
```
Integer i = new Integer(100);
int j = 100;
System.out.ptintln(i == j);
//输出
true
```
非new生成的Integer变量和new Integer()生成的变量比较时，结果为false。（因为 ①当变量值在-128~127之间时，非new生成的Integer变量指向的是java常量池中的对象，而new Integer()生成的变量指向堆中新建的对象，两者在内存中的地址不同）
```
Integer i = new Integer(100);
Integer j = 100;
System.out.print(i == j);
//输出
false
```
对于两个非new生成的Integer对象，进行比较时，如果两个变量的值在区间-128到127之间，则比较结果为true，如果两个变量的值不在此区间，则比较结果为false。
```
Integer i = 100;
Integer j = 100;
System.out.print(i == j); 
//输出
true
Integer i = 128;
Integer j = 128;
System.out.print(i == j); 
//输出
false
```
对于上面输出结果的原因：
java在编译Integer i =100 ;时，会翻译成为Integer i = Integer.valueOf(100);而java API中对Integer类型的valueOf的定义如下：
```
public static Integer valueOf(int i){
    assert IntegerCache.high >= 127;
    if (i >= IntegerCache.low && i <= IntegerCache.high){
        return IntegerCache.cache[i + (-IntegerCache.low)];
    }
    return new Integer(i);
}
```
从上面我们可以知道给 Interger 赋予的 int 数值在 - 128 - 127 的时候，直接从 cache 中获取，这些 cache 引用对 Integer 对象地址是不变的，但是不在这个范围内的数字，则 new Integer (i) 这个地址是新的地址，不可能一样的.

#### 47. 有了 int 为什么还要有 Integer ？
（1）因为Java语言是面向对象的，对象封装可以把属性（数据跟处理这些数据的方法）结合在一起。比如Integer就有parseInt()等方法来专门处理int型相关的数据。
（2）在Java中绝大部分方法或类都是用来处理类类型对象的，如ArrayList和LinkedList集合类就只能以类作为它的存储对象，而这时如果想把一个int型的数据存入list是不可能的，必须把它包装成类，也就是Integer才能被List所接受。

#### 48. Integer 的装箱和拆箱
（1）自动装箱，将基本数据类型转化为对象
```
//等价于Integer num = Integer.valueOf(100);
Integer i=100;
```
（2）自动拆箱，将对象转化为基本数据类型
```
//声明一个Integer对象
Integer i = 100;
//进行计算时自动拆箱
i++;
```

#### 49. String是否是基本数据类型？
（1）首先说不是基本类型。
（2）JAVA一共有八种基本数据类型：byte，short，char，int，long，double，float，boolean

#### 50. String aaaStr="aaa" 与 String aaaStr = new String("aaa") 相同么？
（1）String aaaStr = "aaa" 会将字符串aaa分配到常量池中，如果常量池中没有该字符串，则会在常量池中创建一个字符串aaa，然后把地址赋给变量aaaStr；如果存在字符串aaa，则直接将常量池中字符串aaa的地址赋给aaaStr
（2）String aaaStr = new String("aaa") 会在堆内存中创建一个String对象，并将对象的地址赋给aaaStr，后期如果仍然有String bbbStr = new String("aaa") 及时字符串都是aaa，但是仍然是新创建一个String对象，是分别的两个对象

#### 51. 什么是反射？
（1）Java中反射是动态获取信息以及动态调用对象方法的一种反射机制。
（2）Java反射就是在运行状态中，对于任意一个类，都能够知道这个类的所有属性和方法；对于任意一个对象，都能够调用它的任意方法和属性；并且能改变它的属性。而这也是Java被视为动态语言的一个关键性质。
（3）Java反射的功能是在运行时判断任意一个对象所属的类，在运行时构造任意一个类的对象，在运行时判断任意一个类所具有的成员变量和方法，在运行时调用任意一个对象的方法，生成动态代理。
（4）Java反射的实现方式
第一种，使用 Class.forName 静态方法。当你知道该类的全路径名时，你可以使用该方法获取 Class 类对象。
```
Class clz = Class.forName("com.aaa.Apple");
Apple apple = (Apple)clz.newInstance();
```
第二种，使用 .class 方法。这种方法只适合在编译前就知道操作的 Class。
```
Class clz = Apple.class;
Constructor constructor = clz.getConstructor();
Apple apple = (Apple)constructor.newInstance();
```
第三种，使用类对象的 getClass() 方法。
```
String str = new String("Hello");
Class clz = str.getClass();
```

#### 52. Java 中为什么不允许从静态方法中访问非静态变量？
（1）静态变量属于类本身，在类加载的时候就会分配内存，可以通过类名直接访问
（2）非静态变量属于类的对象，只有在类的对象产生时，才会分配内存，通过类的实例去访问
（3）静态方法也属于类本身，但是此时没有类的实例，内存中没有非静态变量，所以无法调用
（4）说白了就是静态方法读取非静态变量，很可能不知道当时值是什么，不确定，没有实例化，静态方法也找不到它

#### 53. float 和 double 的区别是什么？
（1）内存中占有的字节数不同，单精度浮点数float在内存中占有4个字节，双精度浮点数double在内存中占有8个字节
（2）有效数字位数不同，单精度浮点数有效数字8位，双精度浮点数有效数字16位；
（3）数值取值范围不同，单精度浮点数的表示范围：-3.40E+38~3.40E+38，双精度浮点数的表示范围：-1.79E+308~-1.79E+308
（4）在程序中处理速度不同 一般来说，CPU处理单精度浮点数的速度比双精度浮点数的速度快；如果不声明，默认小数是double类型，如果想用float，要进行强转。
举例float f=1.3；会编译报错，正确的写法是float f = (float)1.3，或者float a = 1.3f，或者float a = 1.3f
注意 float是八位有效数字，第七位会四舍五入。

#### 54. Java 中 6*0.1 == 0.6 是否为true？
返回false，因为浮点数不能完全精确的表示，一般会损失一定的精度。下面例子可以看出来6*0.1得到结果是0.6000000000000001，但是5*0.1却没有问题
```
public static void main(String[] args) {
    System.out.println(6*0.1 == 0.6);
    System.out.println(6*0.1);
    System.out.println(0.6);
    System.out.println(5*0.1 == 0.5);
    System.out.println(5*0.1);
    System.out.println(0.5);
}
//输出
false
0.6000000000000001
0.6
true
0.5
0.5
```

#### 55. 实例化创建对象有几种方式？
（1）通过 new 对象的方式创建
`TestBean a = new TestBean();`
（2）通过 clone() 方法创建
`TestBean b = a.clone();`
（3）通过反射机制创建，第51题已经写出了反射的创建例子代码
```
Class clz = Class.forName("com.aaa.Apple");
Apple apple = (Apple)clz.newInstance();

Class clz = Apple.class;
Constructor constructor = clz.getConstructor();
Apple apple = (Apple)constructor.newInstance();

String str = new String("Hello");
Class clz = str.getClass();
```
（4）序列化反序列化
```
public static void main(String[] args) {
    ObjectInputStream in = ObjectInputStream(new FilelnputStream("/data.txt"));
    TestBean a = (TestBean) in.readObject();
    System.out.println("反序列化a：" + a);
    in.close();
}
```

#### 56. @NotEmpty,@NotNull和@NotBlank的区别
（1）@NotEmpty，不能为null，且Size>0
（2）@NotNull，不能为null，但可以为empty,没有Size的约束
（3）@NotBlank，只用于String,不能为null且trim()之后size>0

#### 57. try {}里有一个return语句，那么紧跟在这个try后的finally{}里的code会不会被执行，什么时候被执行，在return前还是后?
（1）finally{}中的语句是一定会执行的，那么这个可能正常脱口而出就是return之前，return之后可能就出了这个方法了，鬼知道跑哪里去了，但更准确的应该是在return中间执行，请看下面程序代码的运行结果：
```
public class TestMain {
    public static void main(String[] args) {
        TestMain test = new TestMain();
        System.out.println(test.test());
        ;
    }

    public int test() {
        int x = 1;
        try {
            System.out.println("try method");
            return x;
        } finally {
            System.out.println("finally");
            ++x;
        }
    }
}
//输出
try method
finally
1
```
（2）运行结果分别按照顺序输出，try内部日志，finally内部日志，最终返回结果1
（3）为什么呢？主函数调用子函数并得到结果的过程，好比主函数准备一个空罐子，当子函数要返回结果时，先把结果放在罐子里，然后再将程序逻辑返回到主函数。所谓返回，就是子函数说，我不运行了，你主函数继续运行吧，这没什么结果可言，结果是在说这话之前放进罐子里的。

#### 58. 能将 int 强制转换为 byte 类型的变量吗？如果该值大于 byte 类型的范围，将会出现什么现象？
可以做强制转换，但是 Java 中 int 是 32 位的，而 byte 是 8 位的，但是，如果强制转化，int 类型的高 24 位将会被丢弃，因为byte 类型的范围是从 -128 到 128。

#### 59. 字节流与字符流的区别
（1）要把一段二进制数据数据逐一输出到某个设备中，或者从某个设备中逐一读取一段二进制数据，不管输入输出设备是什么，我们要用统一的方式来完成这些操作，用一种抽象的方式进行描述，这个抽象描述方式起名为IO流，对应的抽象类为OutputStream和InputStream，不同的实现类就代表不同的输入和输出设备，它们都是针对字节进行操作的。
（2）计算机中的一切最终都是二进制的字节形式存在。对于经常用到的中文字符，首先要得到其对应的字节，然后将字节写入到输出流。读取时，首先读到的是字节，可是我们要把它显示为字符，我们需要将字节转换成字符。由于这样的需求很广泛，Java专门提供了字符流包装类。
（3）底层设备永远只接受字节数据，有时候要写字符串到底层设备，需要将字符串转成字节再进行写入。字符流是字节流的包装，字符流则是直接接受字符串，它内部将串转成字节，再写入底层设备，这为我们向IO设备写入或读取字符串提供了一点点方便。
（4）字符向字节转换时，要注意编码的问题，因为字符串转成字节数组，其实是转成该字符的某种编码的字节形式，读取也是反之的道理。

#### 60. 什么是java序列化，如何实现java序列化？或者请解释Serializable接口的作用。
（1）将一个java对象变成字节流的形式传出去或者从一个字节流中恢复成一个java对象，例如，要将java对象存储到硬盘或者传送给网络上的其他计算机，这个过程我们可以自己写代码去把一个java对象变成某个格式的字节流再传输。
（2）jre本身就提供了这种支持，我们可以调用OutputStream的writeObject方法来做，如果要让java帮我们做，要被传输的对象必须实现serializable接口，这样，javac编译时就会进行特殊处理，编译的类才可以被writeObject方法操作，这就是所谓的序列化。需要被序列化的类必须实现Serializable接口，该接口是一个mini接口，其中没有需要实现方法，implements Serializable只是为了标注该对象是可被序列化的。
（3）在web开发中，如果对象被保存在了Session中，tomcat在重启时要把Session对象序列化到硬盘，这个对象就必须实现Serializable接口。如果对象要经过分布式系统进行网络传输，被传输的对象就必须实现Serializable接口。

#### 61. switch语句能否作用在byte上，能否作用在long上，能否作用在String上?
（1）在switch（e）中，e只能是一个整数表达式或者枚举常量，整数表达式可以是int基本类型或Integer包装类型，由于byte,short,char都可以隐含转换为int，所以，这些类型以及这些类型的包装类型也是可以的。
（2）jdk1.7之后加入String，通过hashCode转化为int，所以可以适用于switch语句中。
（3）long类型都不符合switch的语法规定，并且不能被隐式转换成int类型，所以，它们不能作用于swtich语句中。

#### 62. 使用final关键字修饰一个变量时，是引用不能变，还是引用的对象不能变？
（1）使用final关键字修饰一个变量时，是指引用变量不能变，引用变量所指向的对象中的内容还是可以改变的。例如，对于如下语句：
```
finalStringBuffer a=new StringBuffer("immutable");
//执行如下语句将报告编译期错误：
a=new StringBuffer("");
//但是，执行如下语句则可以通过编译：
a.append(" broken!");
```
（2）有人在定义方法的参数时，可能想采用如下形式来阻止方法内部修改传进来的参数对象
```
public void method(final StringBuffer param){
}
```
（3）在该方法内部仍然可以增加如下代码来修改参数对象
```
param.append("a");
```

#### 63. 是否可以从一个static方法内部发出对非static方法的调用？
可以，可以通过在内部对非static方法的类实例化后，在调用即可，代码如下
```
public class TestController {

    public static void main(String[] args) {
        for (int i = 0; i < 5; i++) {
            TestController.ttt();
        }
    }
    public static void ttt() {
        TestController a = new TestController();
        System.out.println(a);
        a.test();
    }

    public void test(){
        System.out.println("1111");
    }
}
//输出
com.buxuesong.account.api.controller.TestController@2530c12
1111
com.buxuesong.account.api.controller.TestController@73c6c3b2
1111
com.buxuesong.account.api.controller.TestController@48533e64
1111
com.buxuesong.account.api.controller.TestController@64a294a6
1111
com.buxuesong.account.api.controller.TestController@7e0b37bc
1111
```