/* Converts ttf font files to js objects */

/* Import all the AcariSans styles and weights */
import AcariSansRegular from './AcariSans-Regular.ttf';
import AcariSansLight from './AcariSans-Light.ttf';
import AcariSansMedium from './AcariSans-Medium.ttf';
import AcariSansSemiBold from './AcariSans-SemiBold.ttf';
import AcariSansBold from './AcariSans-Bold.ttf';
import AcariSansItalic from './AcariSans-Italic.ttf';
import AcariSansLightItalic from './AcariSans-LightItalic.ttf';
import AcariSansMediumItalic from './AcariSans-MediumItalic.ttf';
import AcariSansSemiBoldItalic from './AcariSans-SemiBoldItalic.ttf';
import AcariSansBoldItalic from './AcariSans-BoldItalic.ttf';

/* DECLARATION ORDER MATTERS */
const acariSansRegular = {
    fontFamily: 'AcariSans',
    fontStyle: 'normal',
    fontDisplay: 'swap',
    src: `url(${AcariSansRegular})`,
    unicodeRange:
        'U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF',
};

const acariSansLight = {
    fontFamily: 'AcariSans',
    fontWeight: 'light',
    src: `url(${AcariSansLight})`,
    unicodeRange:
        'U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF',
};

const acariSansMedium = {
    fontFamily: 'AcariSans',
    fontWeight: 'medium',
    src: `url(${AcariSansMedium})`,
    unicodeRange:
        'U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF',
};

const acariSansSemiBold = {
    fontFamily: 'AcariSans',
    fontDisplay: 'swap',
    fontWeight: 600,
    src: `url(${AcariSansSemiBold})`,
    unicodeRange:
        'U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF',
};

const acariSansBold = {
    fontFamily: 'AcariSans',
    fontDisplay: 'swap',
    fontWeight: 'bold',
    src: `url(${AcariSansBold})`,
    unicodeRange:
        'U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF',
};

const acariSansItalic = {
    fontFamily: 'AcariSans',
    fontDisplay: 'swap',
    fontStyle: 'italic',
    src: `url(${AcariSansItalic})`,
    unicodeRange:
        'U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF',
};

const acariSansLightItalic = {
    fontFamily: 'AcariSans',
    fontDisplay: 'swap',
    fontWeight: 'light',
    fontStyle: 'italic',
    src: `url(${AcariSansLightItalic})`,
    unicodeRange:
        'U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF',
};

const acariSansMediumItalic = {
    fontFamily: 'AcariSans',
    fontDisplay: 'swap',
    fontWeight: 'medium',
    fontStyle: 'italic',
    src: `url(${AcariSansMediumItalic})`,
    unicodeRange:
        'U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF',
};

const acariSansSemiBoldItalic = {
    fontFamily: 'AcariSans',
    fontDisplay: 'swap',
    fontWeight: 600,
    fontStyle: 'italic',
    src: `url(${AcariSansSemiBoldItalic})`,
    unicodeRange:
        'U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF',
};

const acariSansBoldItalic = {
    fontFamily: 'AcariSans',
    fontDisplay: 'swap',
    fontWeight: 'bold',
    fontStyle: 'italic',
    src: `url(${AcariSansBoldItalic})`,
    unicodeRange:
        'U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF',
};


export { 
    acariSansRegular, 
    acariSansLight,
    acariSansMedium,
    acariSansSemiBold,
    acariSansBold,
    acariSansItalic,
    acariSansLightItalic,
    acariSansMediumItalic,
    acariSansSemiBoldItalic,
    acariSansBoldItalic
}