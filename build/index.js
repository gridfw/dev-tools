'use strict';
var DevTools, MOUNT_PATH, devApp;

devApp = require('./app');

MOUNT_PATH = '/?:dev/*';

DevTools = class DevTools {
  constructor(app) {
    this.app = app;
    this.enabled = true; // the plugin is enabled
    this._mountPath = MOUNT_PATH;
    return;
  }

  /**
   * Reload the app
   * @optional @param {String} mountPath - mount path, @default MOUNT_PATH
   */
  reload(options) {
    this._mountPath = options.mountPath || MOUNT_PATH;
  }

  /**
   * destroy
   */
  destroy() {
    this.disable();
  }

  /**
   * Disable, enable
   */
  disable() {
    this.app.off(this._mountPath, devApp);
  }

  enable() {
    this.app.all(this._mountPath, devApp);
  }

};

module.exports = DevTools;
