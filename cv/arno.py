from lxml import etree as ET
import lxml
import os
import argparse

tanslate_xsl_file = "translate.xsl"
arno_xsl_file = "arno.xsl"
model_rng_file = "curriculum.rng"
langages = ["fra", "eng"]

#-------Interface en ligne de commande-------
usage = ""

parser = argparse.ArgumentParser(usage = usage)
parser.add_argument("--xml", type=str, required=True, help="Fichier xml à traiter pour produire un document html")
parser.add_argument("--lang", type=str, help="Langue désirée (optionnelle)")
args = parser.parse_args()


#-------Analyse de l'instance xml et requêtes XPath-------
parsed_xml = ET.parse(args.xml) #Traitement du fichier xml
translate_xsl = ET.parse(tanslate_xsl_file) #Traitement du fichier xsl

root = parsed_xml.getroot()
person = root.find("person")
name = person.find("name").text.lower().replace(" ", "_")

nationality = person.get("nation")


#-------Validation par rapport au shéma RelaxNG-------
relax_ng = ET.parse(model_rng_file)
relaxng_validator = ET.RelaxNG(relax_ng)
valid = relaxng_validator.validate(parsed_xml)
assert valid == True


#-------Selection langue-------
lang = nationality if args.lang == None else args.lang
if lang not in langages:
    print("The document can't be printed in the langage you gave ({})\n\
Available langages: {} (default: {})".format(lang, " ".join(l for l in langages), nationality))
    exit()

#-------Transformation du xml via xslt-------
arno_xsl = ET.XSLT(ET.parse(arno_xsl_file))
translate_xsl = ET.XSLT(ET.parse(tanslate_xsl_file))

xml_one_langage = translate_xsl(parsed_xml, lang=ET.XSLT.strparam(lang))

root = xml_one_langage.getroot()
title = root.find("title").text

xsl_out = arno_xsl(xml_one_langage, lang=ET.XSLT.strparam(lang), title=ET.XSLT.strparam(title))


#-------Génération du html-------
title = title.lower().replace(" ", "_")
html_filename = "{}-{}.html".format(name, title)

xsl_out.write(html_filename, encoding="utf-8")
print("HTML généré dans le fichier {}".format(html_filename))
