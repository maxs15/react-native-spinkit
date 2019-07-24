module.exports = {
  commands: [
    {
      name: 'prelink',
      func: () => {
        exec("node ./node_modules/react-native-spinkit/scripts/rnpm-prelink.js");
      },
    },
  ],
};
