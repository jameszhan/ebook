
# 名称（Title）
# 创作、制作者（Creator）
# 主题及关键词（Subject and Keywords）
# 说明（Description）
# 出版者（Publisher）
# 发行者（Contributor）
# 时间（Date）
# 类型（Type）
# 格式（Format）
# 标识（Identifier）
# 来源（Source）
# 语言（Language）
# 相关资源（Relation）
# 范围（Coverage）
# 版权（Rights）

class DublinCore
  DCMI_NS = 'http://purl.org/dc/elements/1.1/' # Dublin Core Metadata Initiative (DCMI)
  OPF_NS = 'http://www.idpf.org/2007/opf'

  attr_accessor :title, :creator, :subject, :description, :publisher, :contributor, :date, :type, :format,
                :source, :language, :relation, :coverage, :rights, :identifiers

  def initialize
    @identifiers = {}
    yield self if block_given?
  end

  def add_identifier(type, id)
    @identifiers[type] = id
  end

  def self.load_from_epub(doc)
    # doc.remove_namespaces!
    puts doc
    DublinCore.new do|dc|
      doc.xpath('//ns:*', ns: DCMI_NS).each do|el|
        method_sym = "#{el.name}=".to_sym
        if dc.respond_to?(method_sym)
          dc.send(method_sym, el.content)
        elsif el.name == 'identifier'
          #p el.xpath('@opf:scheme', opf: OPF_NS)
          dc.add_identifier(el.attribute_with_ns('scheme', OPF_NS).value, el.content)
        else
          p "Unknown dc element: #{el}"
        end
      end
    end
  end

  def to_s
    {
        title: title,
        creator: creator,
        subject: subject,
        description: description,
        publisher: publisher,
        contributor: contributor,
        date: date,
        type: type,
        format: format,
        source: source,
        language: language,
        relation: relation,
        coverage: coverage,
        rights: rights,
        identifiers: identifiers
    }
  end

end