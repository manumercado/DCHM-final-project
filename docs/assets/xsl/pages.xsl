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
                            <!-- add the title from the metadata. This is what will be shown on your browsers tab-->
                            <xsl:apply-templates select="//tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                        </title>
                        <!-- load bootstrap css (requires internet!) so you can use their pre-defined css classes to style your html; changed this to full -->
                        <link 
                            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" 
                            rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" 
                            crossorigin="anonymous">
                            <script 
                                src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" 
                                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous">
                            </script>
                        </link>
                        <!-- load the stylesheets in the assets/css folder, where you can modify the styling of your website -->
                        <link rel="stylesheet" href="assets/css/main.css"/>
                        <!-- <link rel="stylesheet" href="assets/css/desktop.css"/> -->
                    </head>
                    <body>
                        <header>
                            <h1>
                                <xsl:value-of select="//tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                            </h1>
                        </header>
                        <nav id="sitenav">
                            <a href="index.html">Home</a> |
                            <a href="postcards.html">Postcard Collection</a> |
                            <a href="about.html">About</a> |
                        </nav>
                        <main class="container">
                            <h2>
                                <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                            </h2>
                            <div class="container"> <!-- Contains both images and transcriptions side to side -->
                                <div id="text-buttons"> <!-- Display different versions of the texts; affects s1 and s2 -->               
                                    <button class="btn btn-outline-dark" onclick="original()">Original text</button>
                                    <button class="btn btn-outline-dark" onclick="edited()">Edited text</button>
                                    <button class="btn btn-outline-dark" onclick="english()">English</button>
                                    <!-- first three functions are for texts buttons and fourth function for zoom tool -->
                                    <script>
                                        function original() {
                                        document.getElementById("s1-original").style.display = "block"
                                        document.getElementById("s1-edited").style.display = "none"
                                        document.getElementById("s1-english").style.display = "none"
                                        document.getElementById("s2-original").style.display = "block"
                                        document.getElementById("s2-edited").style.display = "none"
                                        document.getElementById("s2-english").style.display = "none"}
                                        function edited() {
                                        document.getElementById("s1-edited").style.display = "block"
                                        document.getElementById("s1-original").style.display = "none"
                                        document.getElementById("s1-english").style.display = "none"
                                        document.getElementById("s2-edited").style.display = "block"
                                        document.getElementById("s2-original").style.display = "none"
                                        document.getElementById("s2-english").style.display = "none"}
                                        function english() {
                                        document.getElementById("s1-english").style.display = "block"
                                        document.getElementById("s1-original").style.display = "none"
                                        document.getElementById("s1-edited").style.display = "none"
                                        document.getElementById("s2-english").style.display = "block"
                                        document.getElementById("s2-original").style.display = "none"
                                        document.getElementById("s2-edited").style.display = "none"}
                                        
                                        function zoom(e){
                                        var zoomer = e.currentTarget;
                                        e.offsetX ? offsetX = e.offsetX : offsetX = e.touches[0].pageX
                                        e.offsetY ? offsetY = e.offsetY : offsetX = e.touches[0].pageX
                                        x = offsetX/zoomer.offsetWidth*100
                                        y = offsetY/zoomer.offsetHeight*100
                                        zoomer.style.backgroundPosition = x + '% ' + y + '%';
                                        }
                                    </script>
                                </div>
                                <div class="row"> <!-- Contains col. with img s1 and trans1 -->
                                    <div class="col-sm"> <!-- img s1 -->
                                        <article id="img-postcard-s1">
                                            <figure class="zoom full-image" onmousemove="zoom(event)">
                                                <xsl:attribute name="style">
                                                    background-image:
                                                    url(<xsl:value-of select="tei:facsimile/tei:surface[1]/tei:figure/tei:graphic[1]/@url"/>)
                                                </xsl:attribute>
                                                <img>
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
                                            </figure>
                                        </article>
                                    </div>
                                    <div class="col-sm" id="col-s1"> <!-- trans1; for this to work, must make sure that div facs in body (1) has div 1 (spanish) and div 2 (english) -->
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
                                            <figure class="zoom full-image" onmousemove="zoom(event)">
                                                <xsl:attribute name="style">
                                                    background-image:
                                                    url(<xsl:value-of select="tei:facsimile/tei:surface[2]/tei:figure/tei:graphic[1]/@url"/>)
                                                </xsl:attribute>
                                                <img>
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
                                            </figure>
                                        </article>
                                    </div>
                                    <div class="col-sm" id="col-s2"> <!-- Trans2; for this to work, must make sure that div facs (2) has div 1 (spanish) and div 2 (english) -->
                                        <article id="s2-original">
                                            <xsl:apply-templates select="tei:text/tei:body/tei:div[2]/tei:div[1]"/>
                                        </article>
                                        <article id="s2-edited" style="display:none">
                                            <xsl:apply-templates select="tei:text/tei:body/tei:div[2]/tei:div[1]"/>
                                        </article>
                                        <article id="s2-english" style="display:none">
                                            <xsl:apply-templates select="tei:text/tei:body/tei:div[2]/tei:div[2]"/>
                                        </article>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <footer>
                            <div class="row" id="footer">
                                <div class="row" id="copyright-logo">
                                    <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">
                                        <img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc/4.0/88x31.png"/>
                                    </a>
                                </div>
                                <div class="row" id="copyright-text">
                                    <p>2023 Manuela Mercado &amp; Haliimah Nabuuma</p>
                                </div>
                            </div>
                        </footer>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>       
    </xsl:template>
    
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
    
    <xsl:template match="tei:lg">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:l">
            <xsl:apply-templates/>
        <br/>
    </xsl:template>
    
    <xsl:template match="tei:ab">
        <p>
            <xsl:apply-templates/>
        </p>
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
    
    <xsl:template match="tei:del">
        <del>
            <xsl:apply-templates/>
        </del>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend = 'underline']">
        <u>
            <xsl:apply-templates/>
        </u>
    </xsl:template>
    
</xsl:stylesheet>