#!/usr/bin/env ruby

def replacements() 
    return {
    ['&#34;', '&quot;'] => '"',
    ['&#38;', '&amp;'] => '&',
    ['&#47;', '&frasl;'] => '/',
    ['&#60;', '&lt;'] => '<',
    ['&#62;', '&gt;'] => '>',
    ['&#130;', '&sbquo;'] => '‚',
    ['&#132;', '&bdquo;'] => '„',
    ['&#134;', '&dagger;'] => '†',
    ['&#135;', '&Dagger;'] => '‡',
    ['&#137;', '&permil;'] => '‰',
    ['&#139;', '&lsaquo;'] => '‹',
    ['&#145;', '&lsquo;'] => "'",
    ['&#146;', '&rsquo;'] => '’',
    ['&#147;', '&ldquo;'] => '“',
    ['&#148;', '&rdquo;'] => '”',
    ['&#153;', '&trade;'] => '™',
    ['&#155;', '&rsaquo;'] => '›',
    ['&#160;', '&nbsp;'] => ' ',
    ['&#161;', '&iexcl;'] => '¡',
    ['&#162;', '&cent;'] => '¢',
    ['&#163;', '&pound;'] => '£',
    ['&#164;', '&curren;'] => '¤',
    ['&#165;', '&yen;'] => '¥',
    ['&#166;', '&brvbar;'] => '¦',
    ['&#167;', '&sect;'] => '§',
    ['&#168;', '&uml;'] => '¨',
    ['&#169;', '&copy;'] => '©',
    ['&#170;', '&ordf;'] => 'ª',
    ['&#171;', '&laquo;'] => '«',
    ['&#172;', '&not;'] => '¬',
    ['&#173;', '&shy;'] => '­',
    ['&#174;', '&reg;'] => '®',
    ['&#175;', '&macr;'] => '¯',
    ['&#176;', '&deg;'] => '°',
    ['&#177;', '&plusmn;'] => '±',
    ['&#178;', '&sup2;'] => '²',
    ['&#179;', '&sup3;'] => '³',
    ['&#180;', '&acute;'] => '´',
    ['&#181;', '&micro;'] => 'µ',
    ['&#182;', '&para;'] => '¶',
    ['&#183;', '&middot;'] => '·',
    ['&#184;', '&cedil;'] => '¸',
    ['&#185;', '&sup1;'] => '¹',
    ['&#186;', '&ordm;'] => 'º',
    ['&#187;', '&raquo;'] => '»',
    ['&#188;', '&frac14;'] => '¼',
    ['&#189;', '&frac12;'] => '½',
    ['&#190;', '&frac34;'] => '¾',
    ['&#191;', '&iquest;'] => '¿',
    ['&#192;', '&Agrave;'] => 'À',
    ['&#193;', '&Aacute;'] => 'Á',
    ['&#194;', '&Acirc;'] => 'Â',
    ['&#195;', '&Atilde;'] => 'Ã',
    ['&#196;', '&Auml;'] => 'Ä',
    ['&#197;', '&Aring;'] => 'Å',
    ['&#198;', '&AElig;'] => 'Æ',
    ['&#199;', '&Ccedil;'] => 'Ç',
    ['&#200;', '&Egrave;'] => 'È',
    ['&#201;', '&Eacute;'] => 'É',
    ['&#202;', '&Ecirc;'] => 'Ê',
    ['&#203;', '&Euml;'] => 'Ë',
    ['&#204;', '&Igrave;'] => 'Ì',
    ['&#205;', '&Iacute;'] => 'Í',
    ['&#206;', '&Icirc;'] => 'Î',
    ['&#207;', '&Iuml;'] => 'Ï',
    ['&#208;', '&ETH;'] => 'Ð',
    ['&#209;', '&Ntilde;'] => 'Ñ',
    ['&#210;', '&Ograve;'] => 'Ò',
    ['&#211;', '&Oacute;'] => 'Ó',
    ['&#212;', '&Ocirc;'] => 'Ô',
    ['&#213;', '&Otilde;'] => 'Õ',
    ['&#214;', '&Ouml;'] => 'Ö',
    ['&#215;', '&times;'] => '×',
    ['&#216;', '&Oslash;'] => 'Ø',
    ['&#217;', '&Ugrave;'] => 'Ù',
    ['&#218;', '&Uacute;'] => 'Ú',
    ['&#219;', '&Ucirc;'] => 'Û',
    ['&#220;', '&Uuml;'] => 'Ü',
    ['&#221;', '&Yacute;'] => 'Ý',
    ['&#222;', '&THORN;'] => 'Þ',
    ['&#223;', '&szlig;'] => 'ß',
    ['&#224;', '&agrave;'] => 'à',
    ['&#225;', '&aacute;'] => 'á',
    ['&#226;', '&acirc;'] => 'â',
    ['&#227;', '&atilde;'] => 'ã',
    ['&#228;', '&auml;'] => 'ä',
    ['&#229;', '&aring;'] => 'å',
    ['&#230;', '&aelig;'] => 'æ',
    ['&#231;', '&ccedil;'] => 'ç',
    ['&#232;', '&egrave;'] => 'è',
    ['&#233;', '&eacute;'] => 'é',
    ['&#234;', '&ecirc;'] => 'ê',
    ['&#235;', '&euml;'] => 'ë',
    ['&#236;', '&igrave;'] => 'ì',
    ['&#237;', '&iacute;'] => 'í',
    ['&#238;', '&icirc;'] => 'î',
    ['&#239;', '&iuml;'] => 'ï',
    ['&#240;', '&eth;'] => 'ð',
    ['&#241;', '&ntilde;'] => 'ñ',
    ['&#242;', '&ograve;'] => 'ò',
    ['&#243;', '&oacute;'] => 'ó',
    ['&#244;', '&ocirc;'] => 'ô',
    ['&#245;', '&otilde;'] => 'õ',
    ['&#246;', '&ouml;'] => 'ö',
    ['&#247;', '&divide;'] => '÷',
    ['&#248;', '&oslash;'] => 'ø',
    ['&#249;', '&ugrave;'] => 'ù',
    ['&#250;', '&uacute;'] => 'ú',
    ['&#251;', '&ucirc;'] => 'û',
    ['&#252;', '&uuml;'] => 'ü',
    ['&#253;', '&yacute;'] => 'ý',
    ['&#254;', '&thorn;'] => 'þ',
    ['&#255;', '&yuml;'] => 'ÿ',
    ['&#402;', '&fnof;'] => 'ƒ',
    ['&#913;', '&Alpha;'] => 'Α',
    ['&#914;', '&Beta;'] => 'Β',
    ['&#915;', '&Gamma;'] => 'Γ',
    ['&#916;', '&Delta;'] => 'Δ',
    ['&#917;', '&Epsilon;'] => 'Ε',
    ['&#918;', '&Zeta;'] => 'Ζ',
    ['&#919;', '&Eta;'] => 'Η',
    ['&#920;', '&Theta;'] => 'Θ',
    ['&#921;', '&Iota;'] => 'Ι',
    ['&#922;', '&Kappa;'] => 'Κ',
    ['&#923;', '&Lambda;'] => 'Λ',
    ['&#924;', '&Mu;'] => 'Μ',
    ['&#925;', '&Nu;'] => 'Ν',
    ['&#926;', '&Xi;'] => 'Ξ',
    ['&#927;', '&Omicron;'] => 'Ο',
    ['&#928;', '&Pi;'] => 'Π',
    ['&#929;', '&Rho;'] => 'Ρ',
    ['&#931;', '&Sigma;'] => 'Σ',
    ['&#932;', '&Tau;'] => 'Τ',
    ['&#933;', '&Upsilon;'] => 'Υ',
    ['&#934;', '&Phi;'] => 'Φ',
    ['&#935;', '&Chi;'] => 'Χ',
    ['&#936;', '&Psi;'] => 'Ψ',
    ['&#937;', '&Omega;'] => 'Ω',
    ['&#945;', '&alpha;'] => 'α',
    ['&#946;', '&beta;'] => 'β',
    ['&#947;', '&gamma;'] => 'γ',
    ['&#948;', '&delta;'] => 'δ',
    ['&#949;', '&epsilon;'] => 'ε',
    ['&#950;', '&zeta;'] => 'ζ',
    ['&#951;', '&eta;'] => 'η',
    ['&#952;', '&theta;'] => 'θ',
    ['&#953;', '&iota;'] => 'ι',
    ['&#954;', '&kappa;'] => 'κ',
    ['&#955;', '&lambda;'] => 'λ',
    ['&#956;', '&mu;'] => 'μ',
    ['&#957;', '&nu;'] => 'ν',
    ['&#958;', '&xi;'] => 'ξ',
    ['&#959;', '&omicron;'] => 'ο',
    ['&#960;', '&pi;'] => 'π',
    ['&#961;', '&rho;'] => 'ρ',
    ['&#962;', '&sigmaf;'] => 'ς',
    ['&#963;', '&sigma;'] => 'σ',
    ['&#964;', '&tau;'] => 'τ',
    ['&#965;', '&upsilon;'] => 'υ',
    ['&#966;', '&phi;'] => 'φ',
    ['&#967;', '&chi;'] => 'χ',
    ['&#968;', '&psi;'] => 'ψ',
    ['&#969;', '&omega;'] => 'ω',
    ['&#977;', '&thetasym;'] => 'ϑ',
    ['&#978;', '&upsih;'] => 'ϒ',
    ['&#982;', '&piv;'] => 'ϖ',
    ['&#8226;', '&bull;'] => '•',
    ['&#8230;', '&hellip;'] => '…',
    ['&#8242;', '&prime;'] => '′',
    ['&#8243;', '&Prime;'] => '″',
    ['&#8254;', '&oline;'] => '‾',
    ['&#8465;', '&image;'] => 'ℑ',
    ['&#8472;', '&weierp;'] => '℘',
    ['&#8476;', '&real;'] => 'ℜ',
    ['&#8501;', '&alefsym;'] => 'ℵ',
    ['&#8592;', '&larr;'] => '←',
    ['&#8593;', '&uarr;'] => '↑',
    ['&#8594;', '&rarr;'] => '→',
    ['&#8595;', '&darr;'] => '↓',
    ['&#8596;', '&harr;'] => '↔',
    ['&#8629;', '&crarr;'] => '↵',
    ['&#8656;', '&lArr;'] => '⇐',
    ['&#8657;', '&uArr;'] => '⇑',
    ['&#8658;', '&rArr;'] => '⇒',
    ['&#8659;', '&dArr;'] => '⇓',
    ['&#8660;', '&hArr;'] => '⇔',
    ['&#8704;', '&forall;'] => '∀',
    ['&#8706;', '&part;'] => '∂',
    ['&#8707;', '&exist;'] => '∃',
    ['&#8709;', '&empty;'] => '∅',
    ['&#8711;', '&nabla;'] => '∇',
    ['&#8712;', '&isin;'] => '∈',
    ['&#8713;', '&notin;'] => '∉',
    ['&#8715;', '&ni;'] => '∋',
    ['&#8719;', '&prod;'] => '∏',
    ['&#8721;', '&sum;'] => '∑',
    ['&#8722;', '&minus;'] => '−',
    ['&#8727;', '&lowast;'] => '∗',
    ['&#8730;', '&radic;'] => '√',
    ['&#8733;', '&prop;'] => '∝',
    ['&#8734;', '&infin;'] => '∞',
    ['&#8736;', '&ang;'] => '∠',
    ['&#8743;', '&and;'] => '∧',
    ['&#8744;', '&or;'] => '∨',
    ['&#8745;', '&cap;'] => '∩',
    ['&#8746;', '&cup;'] => '∪',
    ['&#8747;', '&int;'] => '∫',
    ['&#8756;', '&there4;'] => '∴',
    ['&#8764;', '&sim;'] => '∼',
    ['&#8773;', '&cong;'] => '≅',
    ['&#8776;', '&asymp;'] => '≈',
    ['&#8800;', '&ne;'] => '≠',
    ['&#8801;', '&equiv;'] => '≡',
    ['&#8804;', '&le;'] => '≤',
    ['&#8805;', '&ge;'] => '≥',
    ['&#8834;', '&sub;'] => '⊂',
    ['&#8835;', '&sup;'] => '⊃',
    ['&#8836;', '&nsub;'] => '⊄',
    ['&#8838;', '&sube;'] => '⊆',
    ['&#8839;', '&supe;'] => '⊇',
    ['&#8853;', '&oplus;'] => '⊕',
    ['&#8855;', '&otimes;'] => '⊗',
    ['&#8869;', '&perp;'] => '⊥',
    ['&#8901;', '&sdot;'] => '⋅',
    ['&#8968;', '&lceil;'] => '⌈',
    ['&#8969;', '&rceil;'] => '⌉',
    ['&#8970;', '&lfloor;'] => '⌊',
    ['&#8971;', '&rfloor;'] => '⌋',
    ['&#9001;', '&lang;'] => '〈',
    ['&#9002;', '&rang;'] => '〉',
    ['&#9674;', '&loz;'] => '◊',
    ['&#9824;', '&spades;'] => '♠',
    ['&#9827;', '&clubs;'] => '♣',
    ['&#9829;', '&hearts;'] => '♥',
    ['&#9830;', '&diams;'] => '♦'
    }
end