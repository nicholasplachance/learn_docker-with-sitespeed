const url = 'https://www.nike.com';

async function measureURL(context, commands) {
  context.log.info('Start to measure my first URL');
  return commands.measure.start(url);
}

module.exports = measureURL;
