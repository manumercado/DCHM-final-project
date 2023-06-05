<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:html="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs tei html" version="2.0">
    <xsl:output method="html"/>

    <xsl:template match="tei:teiCorpus">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <html lang="en" xml:lang="en">
            <head>
                <title>
                    <!-- add the title from the metadata. This is what will be shown
                    on your browsers tab-->
                    <xsl:apply-templates
                        select="//tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"
                    />
                </title>
                <!-- load bootstrap css (requires internet!) so you can use their pre-defined css classes to style your html -->
                <link 
                    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" 
                    rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" 
                    crossorigin="anonymous">
                    <script 
                        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" 
                        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous">
                    </script>
                </link>
                <link rel="stylesheet" href="assets/css/main.css"/>
                <!-- <link rel="stylesheet" href="assets/css/desktop.css"/> -->
            </head>
            <body>
                <header>
                    <h1>
                        <xsl:apply-templates
                            select="//tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"
                        />
                    </h1>
                </header>
                <nav id="sitenav">
                    <a href="index.html">Home</a> | 
                    <a href="postcards.html">Postcard Collection</a> | 
                    <a href="about.html">About</a> |
                </nav>
                <main class="container">
                    <div class="row">
                        <div class="col-sm">
                            <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel"> <!-- chose three random postcards (portrait) to display  -->
                                <div class="carousel-inner">
                                    <div class="carousel-item active" data-bs-interval="4000">
                                        <img>
                                        <xsl:attribute name="src">
                                            <xsl:value-of
                                                select="tei:TEI[4]/tei:facsimile/tei:surface[1]/tei:figure/tei:graphic[2]/@url"
                                            />
                                        </xsl:attribute>
                                        <xsl:attribute name="title">
                                            <xsl:value-of
                                                select="tei:TEI[4]/tei:facsimile/tei:surface[1]/tei:figure/tei:label"
                                            />
                                        </xsl:attribute>
                                        <xsl:attribute name="alt">
                                            <xsl:value-of
                                                select="tei:TEI[4]/tei:facsimile/tei:surface[1]/tei:figure/tei:figDesc"
                                            />
                                        </xsl:attribute>
                                        </img>
                                    </div>
                                    <div class="carousel-item" data-bs-interval="4000">
                                        <img>
                                            <xsl:attribute name="src">
                                                <xsl:value-of
                                                    select="tei:TEI[1]/tei:facsimile/tei:surface[1]/tei:figure/tei:graphic[2]/@url"
                                                />
                                            </xsl:attribute>
                                            <xsl:attribute name="title">
                                                <xsl:value-of
                                                    select="tei:TEI[1]/tei:facsimile/tei:surface[1]/tei:figure/tei:label"
                                                />
                                            </xsl:attribute>
                                            <xsl:attribute name="alt">
                                                <xsl:value-of
                                                    select="tei:TEI[1]/tei:facsimile/tei:surface[1]/tei:figure/tei:figDesc"
                                                />
                                            </xsl:attribute> 
                                        </img>
                                    </div>
                                    <div class="carousel-item" data-bs-interval="4000">
                                        <img>
                                            <xsl:attribute name="src">
                                                <xsl:value-of
                                                    select="tei:TEI[3]/tei:facsimile/tei:surface[1]/tei:figure/tei:graphic[2]/@url"
                                                />
                                            </xsl:attribute>
                                            <xsl:attribute name="title">
                                                <xsl:value-of
                                                    select="tei:TEI[3]/tei:facsimile/tei:surface[1]/tei:figure/tei:label"
                                                />
                                            </xsl:attribute>
                                            <xsl:attribute name="alt">
                                                <xsl:value-of
                                                    select="tei:TEI[3]/tei:facsimile/tei:surface[1]/tei:figure/tei:figDesc"
                                                />
                                            </xsl:attribute> 
                                        </img>
                                    </div>
                                    <div class="carousel-item" data-bs-interval="4000">
                                        <img>
                                            <xsl:attribute name="src">
                                                <xsl:value-of
                                                    select="tei:TEI[19]/tei:facsimile/tei:surface[1]/tei:figure/tei:graphic[2]/@url"
                                                />
                                            </xsl:attribute>
                                            <xsl:attribute name="title">
                                                <xsl:value-of
                                                    select="tei:TEI[19]/tei:facsimile/tei:surface[1]/tei:figure/tei:label"
                                                />
                                            </xsl:attribute>
                                            <xsl:attribute name="alt">
                                                <xsl:value-of
                                                    select="tei:TEI[19]/tei:facsimile/tei:surface[1]/tei:figure/tei:figDesc"
                                                />
                                            </xsl:attribute> 
                                        </img>
                                    </div>
                                    <div class="carousel-item" data-bs-interval="4000">
                                        <img>
                                            <xsl:attribute name="src">
                                                <xsl:value-of
                                                    select="tei:TEI[6]/tei:facsimile/tei:surface[1]/tei:figure/tei:graphic[2]/@url"
                                                />
                                            </xsl:attribute>
                                            <xsl:attribute name="title">
                                                <xsl:value-of
                                                    select="tei:TEI[6]/tei:facsimile/tei:surface[1]/tei:figure/tei:label"
                                                />
                                            </xsl:attribute>
                                            <xsl:attribute name="alt">
                                                <xsl:value-of
                                                    select="tei:TEI[6]/tei:facsimile/tei:surface[1]/tei:figure/tei:figDesc"
                                                />
                                            </xsl:attribute> 
                                        </img>
                                    </div>
                                </div>
                            </div>
                        </div>  
                        <div class="col-sm">
                            <article>
                                <h2>Welcome to the Digital Collection</h2>
                                <p>
                                    
                                 </p>
                            </article>
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
    </xsl:template>

    <xsl:template match="tei:teiHeader"/>

</xsl:stylesheet>
