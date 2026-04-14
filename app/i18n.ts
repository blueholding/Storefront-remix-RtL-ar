export default {
  supportedLngs: ['ar'],
  fallbackLng: 'ar',
  // Disabling suspense is recommended
  react: { useSuspense: false },
  backend: {
    loadPath: '../public/locales/{{lng}}/{{ns}}.json',
  },
};
