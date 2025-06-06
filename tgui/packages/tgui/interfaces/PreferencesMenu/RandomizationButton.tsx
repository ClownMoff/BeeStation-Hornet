import { Dropdown, Icon } from '../../components';
import { RandomSetting } from './data';

export const RandomizationButton = (props: {
  dropdownProps?: Record<string, unknown>;
  setValue: (newValue: RandomSetting) => void;
  value?: RandomSetting;
}) => {
  const { dropdownProps = {}, setValue, value } = props;

  let color;

  switch (value) {
    case RandomSetting.AntagOnly:
      color = 'orange';
      break;
    case RandomSetting.Disabled:
      color = 'red';
      break;
    case RandomSetting.Enabled:
      color = 'green';
      break;
  }

  return (
    <Dropdown
      backgroundColor={color}
      {...dropdownProps}
      clipSelectedText={false}
      displayText={<Icon name="dice-d20" mr="-0.25em" />}
      displayTextFirst
      options={[
        {
          displayText: 'Do not randomize',
          value: RandomSetting.Disabled,
        },

        {
          displayText: 'Always randomize',
          value: RandomSetting.Enabled,
        },

        {
          displayText: 'Randomize when antagonist',
          value: RandomSetting.AntagOnly,
        },
      ]}
      nochevron
      onSelected={setValue}
      menuWidth="120px"
      width="auto"
    />
  );
};
