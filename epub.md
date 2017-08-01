## 什么是 EPUB？
EPUB 是可逆的数字图书和出版物 XML 格式，数字出版业商业和标准协会 International Digital Publishing Forum (IDPF) 制定的标准。IDPF 于 2007 年 10 月正式采用 EPUB，随后被主流出版商迅速采用。可以使用各种开放源代码或者商业软件在所有主流操作系统、Sony PRS 之类的 e-ink 设备或者 Apple iPhone 之类的小型设备上阅读 EPUB 格式。

#### EPUB 与 PDF 有什么不同？

PDF 仍然是世界上应用最广泛的电子文档格式。从图书出版商的角度来看，PDF 的优点包括：

* PDF 文件允许对页面布局进行像素级的控制，包括复杂的打印格式，如多栏格式和奇偶页相间的格式。
* 有多种不同的 GUI 文档工具可生成 PDF，如 Microsoft® Office Word 和 Adobe® InDesign®。
* PDF 阅读器非常普及，现在大多数计算机上都有安装。
* PDF 可以嵌入特殊的字体，精确控制最终的输出结果。

从软件开发人员的角度来看，PDF 还远远不够理想：

* 这不是一种简单易学的标准，因此编写自己的 PDF 生成代码非常困难。
* 虽然 PDF 现在是一种 International Organization for Standardization（ISO）标准（ISO 32000-1:2008），但过去一直受一家公司的控制：Adobe Systems。
* 尽管多数编程语言都提供了 PDF 库，但很多是商业产品或者嵌入到 GUI 应用程序中，外部进程不容易控制。并非所有的免费库都得到积极的维护。
* PDF 原生文本可以通过程序提取出来并进行搜索，但很少可以对 PDF 进行标记以便简单可靠地转化成 Web 友好的格式。
* PDF 文档不容易流动，就是说很难适应小屏幕或者对布局进行明显的改变。


为何说 EPUB 对开发人员是友好的

EPUB 解决了 PDF 和开发人员友好性有关的所有瑕疵。一个 EPUB 就是一个简单 ZIP 格式文件（使用 .epub 扩展名），其中包括按照预先定义的方式排列的文件。如何制作 ZIP 文档有一些技巧，稍后将在 将 EPUB 文件捆绑为 ZIP 文档 一节介绍。除此以外，EPUB 非常简单：

* EPUB 中的所有内容基本上都是 XML。EPUB 文件可使用标准 XML 工具创建，不需要任何专门或者私有的软件。
* EPUB 内容（eBook 的具体内容）基本上都是 XHTML 1.1（另一种格式是 DTBook，为视力受限者编码书籍的一种标准）。
* 大多数 EPUB XML 模式都来自现成的、可免费获得的、已发布的规范。
* 最关键的在于 EPUB 元数据是 XML，EPUB 内容是 XHTML。如果您的文档构建系统产生的结果用于 Web 和/或基于 XML，那么也可用于生成 EPUB。

#### 三合一的标准

EPUB 包括三个单独的 IDPF 规范，虽然实际上将其统称为 EPUB 更保险：

* (Open eBook Publication Structure Container Format ([OCF][epub-ocf]))：定义了 EPUB 档案的目录树结构和文件结构（ZIP）。
* Open Publication Structure (OPS)：定义了电子图书的公共词汇表，特别是可作为图书内容的格式（比如 XHTML 和 CSS）。
* Open Packaging Format (OPF)：描述了 EPUB 必须的和可选的元数据、阅读顺序和目录。

* 开放容器格式（OEBPS Container Format，OCF）3.0，将所有相关文件收集至ZIP压缩档案之中。
* 开放出版结构（Open Publication Structure，OPS）2.0，以定义内容的版面；
* 开放包裹格式（Open Packaging Format，OPF）2.0，定义以XML为基础的.epub档案结构；

此外，对于档案中的特定类型的内容，EPUB 还重用了其他一些标准，如 XHTML 1.0 和 Digital Accessible Information SYstem (DAISY)。

## 结构分析

```
mimetype
META-INF/
    container.xml
    encryption.xml
content.opf
cover.jpeg
fonts/
    ...
images/
    ...
page_styles.css
stylesheet.css
text/
    ...
titlepage.xhtml    
toc.ncx    
```


[epub-ocf]: http://www.idpf.org/epub/301/spec/epub-ocf.html "EPUB Open Container Format (OCF) 3.0.1"