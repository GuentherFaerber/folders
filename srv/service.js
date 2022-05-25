// const cds = require("@sap/cds");
const activationService = require("./activationService");
module.exports = function () {
  this.on("activate", async (req) => {
    await activationService.activate(req);
  });
  this.on("deactivate", async (req) => {
    await activationService.deactivate(req);
  });
};
