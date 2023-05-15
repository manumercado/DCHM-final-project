<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:html="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs tei html" version="2.0">
    <xsl:output method="html"/>
    
    <xsl:template match="tei:teiCorpus">
        <xsl:for-each select="tei:TEI">
            <xsl:variable name="postcardid" select="@xml:id"/>
            <xsl:result-document href="{$postcardid}.html"> <!-- With this we are generating one html per postcard -->
                <html lang="en" xml:lang="en">
                    <head>
                        <title>
                            <!-- add the title from the metadata. This is what will be shown
                    on your browsers tab-->
                            <xsl:apply-templates select="//tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                        </title>
                        <!-- load bootstrap css (requires internet!) so you can use their pre-defined css classes to style your html -->
                        <link rel="stylesheet"
                            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                            crossorigin="anonymous"/>
                        <!-- load the stylesheets in the assets/css folder, where you can modify the styling of your website -->
                        <link rel="stylesheet" href="assets/css/main.css"/>
                        <!-- <link rel="stylesheet" href="assets/css/desktop.css"/> -->
                    </head>
                    <body>
                        <header>
                            <h1>
                                Description: <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                            </h1>
                        </header>
                        <nav id="sitenav">
                            <a href="index.html">Home</a> |
                            <a href="postcards.html">Postcard Collection</a> |
                        </nav>
                        <main>
                            <div class="container"> <!-- Contains both images and transcriptions side to side -->
                                <div id="buttons">                
                                    <button class="btn btn-light" onclick="original()">Original text</button>
                                    <button class="btn btn-light" onclick="edited()">Edited text</button>
                                    <button class="btn btn-light" onclick="english()">English</button>
                                    <script>
                                        function original() {
                                        document.getElementById("s1-original").style.display = "block"
                                        document.getElementById("s1-edited").style.display = "none"
                                        document.getElementById("s1-english").style.display = "none"}
                                        function edited() {
                                        document.getElementById("s1-edited").style.display = "block"
                                        document.getElementById("s1-original").style.display = "none"
                                        document.getElementById("s1-english").style.display = "none"}
                                        function english() {
                                        document.getElementById("s1-english").style.display = "block"
                                        document.getElementById("s1-original").style.display = "none"
                                        document.getElementById("s1-edited").style.display = "none"}
                                    </script>
                                </div>
                                
                                
                                
                                <div class="row"> <!-- Contains col. with img s1 and trans1 -->
                                    <div class="col-sm"> <!-- img s1 -->
                                        <article id="img-postcard-s1">
                                            <img class="full-image">
                                                <xsl:attribute name="src">
                                                    <xsl:value-of select="tei:facsimile/tei:surface[1]/tei:figure/tei:graphic[1]/@url"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="title">
                                                    <xsl:value-of select="tei:facsimile/tei:surface[1]/tei:figure/tei:label"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="alt">
                                                    <xsl:value-of select="tei:facsimile/tei:surface[1]/tei:figure/tei:figDesc"/>
                                                </xsl:attribute>
                                            </img>  
                                        </article>
                                    </div>
                                    <div class="col-sm" id="col-s1"> <!-- trans1 -->
                                        <article id="s1-original">
                                            <xsl:apply-templates select="tei:text/tei:body/tei:div[1]/tei:div[1]"/>                                           
                                        </article>
                                        <article id="s1-edited" style="display:none">
                                            <xsl:apply-templates select="tei:text/tei:body/tei:div[1]/tei:div[1]"/>
                                        </article>
                                        <article id="s1-english" style="display:none">
                                            <xsl:apply-templates select="tei:text/tei:body/tei:div[1]/tei:div[2]"/>
                                        </article>
                                    </div>
                                    
                                </div>
                                <div class="row"> <!-- Contains col. with img s2 and trans2 -->
                                    <div class="col-sm">
                                        <article id="img-postcard-s2">
                                            <img class="full-image">
                                                <xsl:attribute name="src">
                                                    <xsl:value-of select="tei:facsimile/tei:surface[2]/tei:figure/tei:graphic[1]/@url"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="title">
                                                    <xsl:value-of select="tei:facsimile/tei:surface[2]/tei:figure/tei:label"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="alt">
                                                    <xsl:value-of select="tei:facsimile/tei:surface[2]/tei:figure/tei:figDesc"/>
                                                </xsl:attribute>
                                            </img>  
                                        </article>
                                    </div>
                                    <div class="col-sm">
                                        <article class="s2-transcription">
                                            <xsl:value-of select="tei:text/tei:body/tei:div[2]"/>
                                        </article>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </body>
                </html>
                
            </xsl:result-document>
        </xsl:for-each>       
    </xsl:template>
    
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
    
    <xsl:template match="tei:corr">
        <span class="corr">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:sic">
        <span class="sic">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>