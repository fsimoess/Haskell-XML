# Haskell-XML

A ferramente HXT é um validador XML Parser que suporta totalmente o XML 1.0 Standard. Suas extensões validam RelaxNG, outro tipo de Schema e XPath.

# Executar Trab.hs (valida DTD)
	- ./exec nota1.xml -
	- O traço é o dst do main, é o arquivo que vai ser exibido no final
	- O programa usa uma função pronta da ferramenta HXT (readDocument), que válida DTD automaticamente com a tag 'withValidate'
	- Ele pode validar mais de um XML ao mesmo tempo
	- Quando da erro, ele aponta a TAG de erro
	- Caso ocorra a validação, ele printa todo o arquivo XML validado (writeDocument)

# Executar TrabXPath.hs (busca XPath)
	- ./exec nota1.xml -
	- O traço é o dst do main, é o arquivo que vai ser exibido no final
	- O programa usa uma função de busca XPath da ferramenta HXT (getXPathTrees) que recebe a consulta como parametro
	- Como a consulta é feita no próprio código, ele não aponta erros de execução.
	- A consulta gera um arquivo XML com o resultado
	- Caso a consulta esteja errada, o documento gerado é vazio

# Executar TrabSchema.hs
	- ./exec nota1.xml notas.xsd
	- O programa usa a ferramente HXQ, exclusiva para processamento de XQuery porém com uma função de validação por Schema (a HXT não valida Schemas XSD, apenas RelaxNG) (Não existem outras APIs de Haskell, ou seja, essa é a única função de validação de Schema XSD. O único meio alternativo seria converter o arquivo XSD para um arquivo .hs e fazer comparações com o arquivo DTD também em formato .hs)
	- NÃO valida mais de um XML ao mesmo tempo
	- Se for validado, não é exibida mensagem de retorno.
	- Caso haja erro, o programa informa qual a tag que invalida o XML

# Executar TrabXQuery.hs
	- ./exec nota1.xml
	- O programa usa uma função da ferramenta HXQ (xq) que permite que seja escrita uma pesquisa XQuery na função
	- A saída é exibida pela função putXSeq, também da ferramenta
	- Pela pesquisa ser feita em código, não há erros de execução
	- Caso a consulta esteja correta, exibe o resultado.
	- Caso esteja errada, exibe a tag <result> como vazia.

# Executar TrabXSL.hs
	- ./exec notas.xsl nota1.xml
	- Usa um pacote extra da ferramente HXT, o HXT-XSLT, para processamento de XSL
	- O programa converte o arquivo XSL lido com a função readXSLTDoc, semelhante ao readDocument, para uma XSLArrow usando a função 'xsltCompileStylesheet'
	- Com isso, a criação do arquivo de saída é feita automaticamente com a função 'writeDocumentToString'
	- Caso ache o resultado, gera o output em formato XML, não possui saída em HTML
	- Em caso de erro, mostra a saída vazia.
