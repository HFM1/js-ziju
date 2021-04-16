import {
  Assembler
} from '../index'
import { build, readSourceWithKernal } from './utils'

describe('compiler x86', () => {
  it('print', () => {
    let result = new Assembler(readSourceWithKernal('tests/asm/print.js')).compile()

    expect(result.assembly).toMatchSnapshot()

    build(result.assembly,'print')
  });

  it('functionCall', () => {
    let result = new Assembler(readSourceWithKernal('tests/asm/functionCall.js')).compile()

    expect(result.assembly).toMatchSnapshot()

    build(result.assembly,'functionCall')
  });

  it('functionCall', () => {
    let result = new Assembler(readSourceWithKernal('tests/asm/fib.js')).compile()

    expect(result.assembly).toMatchSnapshot()

    build(result.assembly,'fib')
  });
});
